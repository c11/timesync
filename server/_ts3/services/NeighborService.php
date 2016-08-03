<?php

require_once "BaseService.php";

/**
 *  Plot related service
 */
class NeighborService extends BaseService {
	/**
	 * Constructor
	 */
	public function __construct() {
		$this->tablename = "neighborhood";
	}
	
	/**
	 * create vertices for specified plot
	 * 
	 * @param int $project_id project identifier
	 * @param int $tsa scene
	 * @param int $plotid plot identifier
	 * @param int $interpreter
	 * @param string $sqlstr sql value string for insertion
	 * @return int
	 */
	public function createNeighbors($project_id, $tsa, $plotid, $interpreter, $sqlstr) {
		$update_sql = <<<DOQ
			INSERT INTO $this->tablename
			 (plotid, image_year, image_julday, 
			  change_process, patch_size,
			  relative_magnitude, centroid_direction,
			  plot_included, comments,
			  interpreter, tsa, project_id
			 )
			 VALUES $sqlstr
DOQ;

		$delete_sql = <<<DOQ
			DELETE FROM $this->tablename
			WHERE project_id = $project_id
			AND tsa = $tsa
			AND plotid = $plotid
			AND interpreter = $interpreter
DOQ;

		//The sql string need to be at least
		//(1,1111,1,'',1,'',1,'',1,1,'')
		if (strlen($sqlstr)<30) {
			return 1;
		}

		try {
			$this->connect(FALSE);
			
			mysqli_query($this->connection, $delete_sql);
			$this->throwExceptionOnError();
			
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
	 * Delete all neighbors for a given plot
	 * 
	 * @param int $project_id project identifier
	 * @param int $tsa scene
	 * @param int $plotid plot identifier
	 * @param int $interpreter
	 * @return int
	 */
	public function removeAllNeighborsForPlot($project_id, $tsa, $plotid, $interpreter) {
		$sql = <<<DOQ
			DELETE from $this->tablename 
			WHERE project_id = $project_id 
			AND tsa = $tsa 
			AND plotid = $plotid
			AND interpreter = $interpreter
DOQ;
		
		$this->connect();
		
		mysqli_query($sql);
		$this->throwExceptionOnError();
		mysqli_close($this->connection);
		
		return 0;
	}
	
	/**
	 * Return all neighbors for a given plot
	 * 
	 * @param int $project_id project identifier
	 * @param int $tsa scene
	 * @param int $plotid plot identifier
	 * @param int $interpreter
	 * @return array
	 */
	public function getNeighborForPlot($project_id, $tsa, $plotid, $interpreter) {
		if ($interpreter==9999)
			$interpreter = 2;
		
		$where = " project_id=$project_id AND tsa=$tsa AND plotid = $plotid AND interpreter=$interpreter";
		return $this->getAllNeighbors($where);
	}
	
	/**
	 * Returns all neighbors
	 *
	 * @return array
	 */
	public function getAllNeighbors($where="") {
		$this->connect();
		
		$sql = <<<DOQ
			SELECT neighbor_id,
						 plotid,
						 image_year,
						 image_julday,
						 change_process,
						 patch_size,
						 relative_magnitude,
						 centroid_direction,
						 plot_included,
						 comments,
						 interpreter,
						 tsa,
						 project_id
						FROM $this->tablename
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
		
		mysqli_stmt_bind_result($stmt, $row->neighbor_id,
														$row->plotid, 
														$row->image_year,
														$row->image_julday,
														$row->change_process,
														$row->patch_size,
														$row->relative_magnitude,
														$row->centroid_direction,
														$row->plot_included,
														$row->comments,
														$row->interpreter,
														$row->tsa,
														$row->project_id);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
		mysqli_stmt_bind_result($stmt, $row->neighbor_id,
														$row->plotid, 
														$row->image_year,
														$row->image_julday,
														$row->change_process,
														$row->patch_size,
														$row->relative_magnitude,
														$row->centroid_direction,
														$row->plot_included,
														$row->comments,
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
