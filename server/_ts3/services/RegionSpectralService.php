<?php

require_once "BaseService.php";

/**
 *  Plot related service
 */
class RegionSpectralService extends BaseService {

	/**
	 * Constructor
	 */
	public function __construct() {
		$this->tablename = "region_spectrals";
	}

	private function getRegionSpectralImpl($sql, $meta) {
		$this->connect();
		$stmt = mysqli_prepare($this->connection, $sql);
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();

		$rows = array();

		mysqli_stmt_bind_result($stmt, $row->project_id, $row->tsa, $row->plotid,
								$row->sensor, $row->image_year, $row->image_julday,
								$row->b1, $row->b2, $row->b3, $row->b4, $row->b5, $row->b7,
								$row->tcb, $row->tcg, $row->tcw, $row->cloud_cover,
								$row->spectral_scaler, $row->selected, $row->target_day);


		$project_id = $meta['project_id'];
		$tsa = $meta['tsa'];
		$plotid = $meta['plotid'];

		while (mysqli_stmt_fetch($stmt)) {
			$pid = str_pad($row->image_julday, 3, '0', STR_PAD_LEFT);
			$row->url_tcb = "http://timesync.forestry.oregonstate.edu/storages/v3/prj_$project_id/tc/plot_{$plotid}/plot_{$plotid}_{$row->image_year}_{$pid}.png";
			$row->url_743 = "http://timesync.forestry.oregonstate.edu/storages/v3/prj_$project_id/b743/plot_{$plotid}/plot_{$plotid}_{$row->image_year}_{$pid}.png";
			$row->url_432 = "http://timesync.forestry.oregonstate.edu/storages/v3/prj_$project_id/b432/plot_{$plotid}/plot_{$plotid}_{$row->image_year}_{$pid}.png";
	      	$rows[] = $row;
	      	$row = new stdClass();
				mysqli_stmt_bind_result($stmt, $row->project_id, $row->tsa, $row->plotid,
								$row->sensor, $row->image_year, $row->image_julday,
								$row->b1, $row->b2, $row->b3, $row->b4, $row->b5, $row->b7,
								$row->tcb, $row->tcg, $row->tcw, $row->cloud_cover,
								$row->spectral_scaler, $row->selected, $row->target_day);

			$row->url = 'another.png';
		}

		mysqli_stmt_free_result($stmt);
		mysqli_close($this->connection);

		return $rows;
	}

	/**
	 * Returns the all regional spectral for a given plot
	 *
	 * @param int $project_id
	 * @param int $tsa
	 * @param int $plotid
	 * @param int $interpreter
	 * @return stdClass
	 */
	public function getRegionSpectralByPlot($project_id, $tsa, $plotid, $interpreter) {
		$sql = <<<DOQ
		select a.project_id, a.tsa, a.plotid,
			 sensor, a.image_year, a.image_julday,
			  b1, b2, b3, b4, b5, b7, tcb, tcg, tcw,
			  cloud_cover, spectral_scaler, null as selected, target_day
		from (
			SELECT rs.project_id, rs.tsa, rs.plotid,
				 sensor, rs.image_year, rs.image_julday,
				  b1, b2, b3, b4, b5, b7, tcb, tcg, tcw,
				  cloud_cover, spectral_scaler, rsm.image_year as selected, target_day, interpreter,
				  if(rsm.priority is null,1,0) * 1000000000+cloud_cover*1000000 + abs(rs.image_julday-target_day)*1000 + abs(rs.image_julday-target_day+1) as priority
			FROM region_spectrals as rs left join image_preference rsm
			on rs.project_id = rsm.project_id
			and rs.tsa = rsm.tsa
			and rs.plotid = rsm.plotid
			and rs.image_year = rsm.image_year
			and rs.image_julday = rsm.image_julday
			and rsm.interpreter = $interpreter
			where b1+b2+b3 <> 0 and
			b1 < 2000 and
			rs.project_id = $project_id
			and rs.tsa = $tsa
			and rs.plotid = $plotid
		) a join (
			SELECT rs.project_id, rs.tsa, rs.plotid, rs.image_year,
				  min(if(rsm.priority is null,1,0) * 1000000000+cloud_cover*1000000 + abs(rs.image_julday-target_day)*1000 + abs(rs.image_julday-target_day+1)) as priority
			FROM region_spectrals as rs left join image_preference rsm
			on rs.project_id = rsm.project_id
			and rs.tsa = rsm.tsa
			and rs.plotid = rsm.plotid
			and rs.image_year = rsm.image_year
			and rs.image_julday = rsm.image_julday
			and rsm.interpreter = $interpreter
			where rs.project_id = $project_id
			and rs.tsa = $tsa
			and rs.plotid = $plotid and
			b1+b2+b3 <> 0 and
			b1 < 2000
			group by rs.project_id, rs.tsa, rs.plotid, rs.image_year
		) b
		on a.project_id = b.project_id
		and a.tsa = b.tsa
		and a.plotid = b.plotid
		and a.image_year = b.image_year
		and a.priority = b.priority
DOQ;

		$meta = array("project_id"=>$project_id, "tsa"=>$tsa, "plotid"=>$plotid);

		return $this->getRegionSpectralImpl($sql, $meta);

	}

	/**
	 * Returns the all regional spectral for a given plot for a given year
	 *
	 * @param int $project_id
	 * @param int $tsa
	 * @param int $plotid
	 * @param int $year
	 * @return stdClass
	 */
	public function getAllRegionSpectralByPlotForYear($project_id, $tsa, $plotid, $year) {
        $sql = <<<DOQ
			SELECT rs.project_id, rs.tsa, rs.plotid,
				 sensor, rs.image_year, image_julday,
			      b1,  b2, b3,  b4,  b5,  b7,  tcb,  tcg, tcw,
			      cloud_cover, spectral_scaler, null as selected, target_day
			FROM region_spectrals rs
			WHERE rs.project_id = $project_id
			and rs.tsa=$tsa
			and rs.plotid=$plotid
			and rs.image_year = $year
			order by image_year, image_julday
DOQ;

        $meta = array("project_id"=>$project_id, "tsa"=>$tsa, "plotid"=>$plotid);

		return $this->getRegionSpectralImpl($sql, $meta);
	}

	/**
	 * Override default image priority.
	 *
	 * The default priority for all is 1.
	 * when updating the priority, only selected images will be assigned priority of 0,
	 * at the same time all the other image priority will be turned to 1.
	 * Priority 0 will always be selected over priority 1.
	 *
	 * @param int $project_id
	 * @param int $tsa
	 * @param int $plotid
	 * @param int $year
	 * @param int day
	 * @return int
	 */
	public function overrideImagePreference($interpreter, $project_id, $tsa, $plotid, $year, $day, $oldDay) {
		$sql = <<<DOQ
			DELETE from image_preference
			WHERE project_id = $project_id
			AND tsa = $tsa
			AND plotid = $plotid
			AND image_year = $year
			AND interpreter = $interpreter;

DOQ;
		$sql2 = <<<DOQ
			INSERT INTO image_preference (project_id, tsa, plotid, image_year, image_julday, interpreter)
			values ($project_id, $tsa, $plotid, $year, $day, $interpreter)
DOQ;

		$vsql = <<<DOQ
			UPDATE vertex
			SET image_julday = $day
			WHERE image_year = $year
			AND image_julday = $oldDay
			AND tsa = $tsa
			AND plotid = $plotid
			AND project_id = $project_id
			AND interpreter = $interpreter;
DOQ;

		$this->connect(false);
		$this->throwExceptionOnError();

		$result = 0;
		try {
			mysqli_query($this->connection, $sql);
			$this->throwExceptionOnError();

			mysqli_query($this->connection, $sql2);
			$this->throwExceptionOnError();

			mysqli_query($this->connection, $vsql);
			$this->throwExceptionOnError();

			mysqli_commit($this->connection);
		}
		catch (Exception $e) {
			mysqli_rollback($this->connection);
			$result = 1;
		}

		mysqli_close($this->connection);

		return $result;
	}
}

?>
