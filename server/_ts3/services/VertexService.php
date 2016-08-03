<?php

require_once "BaseService.php";

/**
 *  Plot related service
 */
class VertexService extends BaseService {
	/**
	 * Constructor
	 */
	public function __construct() {
		$this->tablename = "vertex";
	}

    function serializeNote($notes) {
        $result = "";
        $idx = 0;
        foreach ($notes as $key=>$value) {
            if ($value) {
                if ($idx++ > 0) {
                    $result .= '|';
                }
                $result .= $key;
            }
        }
        return $result;
    }


	public function saveVertices($vertInfoSave) {
	    $data = json_decode($vertInfoSave);

	    $project_id = $data->projectID;
	    $interpreter = $data->userID;
	    $tsa = $data->tsa;
	    $plotid = $data->plotID;

//	    if ($interpreter != 9) {
//	        echo json_encode('{error:"not allowed!"}');
//	        exit;
//	    }


	    $vertInfos = $data->vertInfo;
	    $vertexValues = "";
	    $idx = 0;
	    foreach ($vertInfos as $vertInfo) {
	        $pLandUseNote = $this->serializeNote($vertInfo->landUse->primary->notes);
	        $sLandUseNote = $this->serializeNote($vertInfo->landUse->secondary->notes);
	        
	        $thisVertex = "($project_id, $tsa, $plotid, $interpreter, $vertInfo->year, $vertInfo->julday, 
	                      '{$vertInfo->landUse->primary->landUse}', '$pLandUseNote',
	                      '{$vertInfo->landUse->secondary->landUse}', '$sLandUseNote',
	                      '{$vertInfo->landCover->landCover}','{$this->serializeNote($vertInfo->landCover->other)}',
	                      '{$vertInfo->changeProcess->changeProcess}', '{$this->serializeNote($vertInfo->changeProcess->notes)}')";
	        if ($idx++>0) {
	            $vertexValues .= ',';
	        }
	        $vertexValues .= $thisVertex;
	    }

        return $this->createVertices($project_id, $tsa, $plotid, $interpreter, $vertexValues, 0);


//	    return $vertexValues;

	}


	/**
	 * create vertices for specified plot
	 *
	 * @param int $project_id project identifier
	 * @param int $tsa scene
	 * @param int $plotid plot identifier
	 * @param int $interpreter
	 * @param string $sqlstr sql value string for insertion
	 * @param int $history_flag
	 * @return int
	 */
	public function createVertices($project_id, $tsa, $plotid, $interpreter, $sqlstr, $history_flag) {
        $update_sql = <<<DOQ
			INSERT INTO $this->tablename
			 (project_id, tsa, plotid, interpreter, image_year, image_julday,
			  dominant_landuse, dominant_landuse_notes,
			  secondary_landuse, secondary_landuse_notes,
			  dominant_landcover, dominant_landcover_notes,
			  change_process, change_process_notes
			 )
			 VALUES $sqlstr
DOQ;

		$delete_sql = <<<DOQ
			DELETE FROM $this->tablename
			WHERE project_id = $project_id
			AND tsa = $tsa
			AND plotid = $plotid
			AND interpreter = $interpreter
			AND history_flag = 0
DOQ;

		$savehistory_sql = <<<DOQ
			UPDATE vertex
			SET history_flag = history_flag - 1
			WHERE project_id = $project_id
			AND tsa = $tsa
			AND plotid = $plotid
			and interpreter = $interpreter
DOQ;

		//The sql string need to be at least
		//(1,1111,1,'',1,'','','',1,'','',1,'','','','')
		if (strlen($sqlstr)<46) {
			return 1;
		}

		try {
			$this->connect(FALSE);

			//if this is trhough final check, store it as history
			if ($history_flag > 0) {
				mysqli_query($this->connection, $savehistory_sql);
				$this->throwExceptionOnError();
			}
			else {
				mysqli_query($this->connection, $delete_sql);
				$this->throwExceptionOnError();
			}

			mysqli_query($this->connection, $update_sql);
			$this->throwExceptionOnError();

			mysqli_commit($this->connection);
			mysqli_close($this->connection);
			return 0;
		}
		catch (Exception $e) {
			mysqli_rollback($this->connection);
			mysqli_close($this->connection);
			throw $e;
		}
	}

	/**
	 * Delete all vertices for a given plot
	 *
	 * @param int $project_id project identifier
	 * @param int $tsa scene
	 * @param int $plotid plot identifier
	 * @param int $interpreter
	 * @return int
	 */
	private function removeAllVerticesForPlot($project_id, $tsa, $plotid, $interpreter) {
		$sql = <<<DOQ
			DELETE from vertex
			WHERE project_id = $project_id
			AND tsa = $tsa
			AND plotid = $plotid
			AND interpreter = $interpreter
DOQ;

		$this->connect();

		mysqli_query($this->connection, $sql);
		$this->throwExceptionOnError();
		mysqli_close($this->connection);

		return 0;
	}

	/**
	 * Return all vertices for a given plot
	 *
	 * @param int $project_id project identifier
	 * @param int $tsa scene
	 * @param int $plotid plot identifier
	 * @param int $interpreter
	 * @param int $history_flag 0: current interpretation
	 * @return array
	 */
	public function getVerticesForPlot($project_id, $tsa, $plotid, $interpreter, $history_flag=0) {
		$sqlh1 = " (SELECT min(history_flag) FROM vertex WHERE project_id=$project_id AND tsa=$tsa AND plotid = $plotid AND interpreter=$interpreter AND history_flag < 0 GROUP BY project_id, tsa, plotid)";
		$sqlh2 = " (SELECT min(history_flag) FROM vertex WHERE project_id=$project_id AND tsa=$tsa AND plotid = $plotid AND history_flag < 0  GROUP BY project_id, tsa, plotid)";

		$history = $history_flag > 0 ? $sqlh1 : 0;
		$where = " project_id=$project_id AND tsa=$tsa AND plotid = $plotid AND interpreter=$interpreter AND history_flag=$history";

		// if ($interpreter <= 5 || $interpreter == 9999) {
		// 	$history = $history_flag > 0 ? $sqlh2 : 0;
		// 	$where = " project_id=$project_id AND tsa=$tsa AND plotid = $plotid AND history_flag=$history";
		// }

		return $this->getAllVertices($where);
	}

	/**
	 * Returns all vertices
	 *
	 * @return array
	 */
	public function getAllVertices($where="") {
		$this->connect();

		$sql = <<<DOQ
			SELECT vertex.vertex_id,
					vertex.plotid,
					vertex.image_year,
					vertex.image_julday,
					vertex.dominant_landuse,
					vertex.dominant_landuse_notes,
					vertex.secondary_landuse,
					vertex.secondary_landuse_notes,
					vertex.dominant_landcover,
					vertex.dominant_landcover_notes,
					vertex.change_process,
					vertex.change_process_notes,
					vertex.interpreter,
					vertex.tsa,
					vertex.project_id
				FROM vertex
				WHERE 1 > 0
DOQ;

		if (strlen($where)>3)
			$sql .= " AND $where";

		$sql .= " ORDER BY plotid, image_year, image_julday";

		$stmt = mysqli_prepare($this->connection, $sql);
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();

		$rows = array();

		mysqli_stmt_bind_result($stmt, $row->vertex_id,
										$row->plotid,
										$row->image_year,
										$row->image_julday,
										$row->dominant_landuse,
										$row->dominant_landuse_notes,
										$row->secondary_landuse,
										$row->secondary_landuse_notes,
										$row->dominant_landcover,
										$row->dominant_landcover_notes,
										$row->change_process,
										$row->change_process_notes,
										$row->interpreter,
										$row->tsa,
										$row->project_id);

	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
			mysqli_stmt_bind_result($stmt, $row->vertex_id,
										$row->plotid,
										$row->image_year,
										$row->image_julday,
										$row->dominant_landuse,
										$row->dominant_landuse_notes,
										$row->secondary_landuse,
										$row->secondary_landuse_notes,
										$row->dominant_landcover,
										$row->dominant_landcover_notes,
										$row->change_process,
										$row->change_process_notes,
										$row->interpreter,
										$row->tsa,
										$row->project_id);
		}

		mysqli_stmt_free_result($stmt);
	  mysqli_close($this->connection);
	  return $rows;
	}


}

?>
