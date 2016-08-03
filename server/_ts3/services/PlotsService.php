<?php

require_once "BaseService.php";

/**
 *  Plot related service
 */
class PlotsService extends BaseService {

	/**
	 * Constructor
	 */
	public function __construct() {
		$this->tablename = "plots";
	}

	/**
	 * Returns all the rows from the table.
	 *
	 * @param int $project_id
	 * @param int $tsa
	 * @param int $interpreter
	 * @return array
	 */
	public function getAllPlots($project_id, $tsa, $interpreter) {
// 		 $sql =<<<DOQ
// 			SELECT plots.project_id, plots.tsa, plots.plotid,
// 				 x, y, lat, lng,
// 				 is_forest, is_tiger_urban, is_complete, is_example, is_wetland, uncertainty
// 			FROM plots left outer join plot_comments
// 			ON plots.plotid = plot_comments.plotid
// 			AND plots.project_id = plot_comments.project_id
// 			AND plots.tsa = plot_comments.tsa
// DOQ;

		 $sql =<<<DOQ
			SELECT plots.project_id, plots.tsa, plots.plotid,
				 lat, lng,
				 is_complete, is_example
			FROM plots left outer join plot_comments
			ON plots.plotid = plot_comments.plotid
			AND plots.project_id = plot_comments.project_id
			AND plots.tsa = plot_comments.tsa
DOQ;

		//super user and viewer can get other's interpretation
		// if ($interpreter>5 && $interpreter!=9999) {
			$sql = $sql . "	AND plot_comments.interpreter = $interpreter ";
		// }

		$sql = $sql . "	WHERE plots.project_id=$project_id AND plots.tsa=$tsa";

		$this->connect();
		$stmt = mysqli_prepare($this->connection, $sql);
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();

		$rows = array();

		// mysqli_stmt_bind_result($stmt,
		// 						$row->project_id,
		// 						$row->tsa,
		// 						$row->plotid,
		// 						$row->x,
		// 						$row->y,
		// 						$row->lat,
		// 						$row->lng,
		// 						$row->is_forest,
		// 						$row->is_tiger_urban,
		// 						$row->is_complete,
		// 						$row->is_example,
		// 						$row->is_wetland,
		// 						$row->uncertainty);

		mysqli_stmt_bind_result($stmt,
								$row->project_id,
								$row->tsa,
								$row->plotid,
								// $row->x,
								// $row->y,
								$row->lat,
								$row->lng,
								// $row->is_forest,
								// $row->is_tiger_urban,
								$row->is_complete,
								$row->is_example);
								// $row->is_wetland,
								// $row->uncertainty);

	  while (mysqli_stmt_fetch($stmt)) {
	  	$rows[] = $row;
	    $row = new stdClass();

			mysqli_stmt_bind_result($stmt,
								$row->project_id,
								$row->tsa,
								$row->plotid,
								// $row->x,
								// $row->y,
								$row->lat,
								$row->lng,
								// $row->is_forest,
								// $row->is_tiger_urban,
								$row->is_complete,
								$row->is_example);
								// $row->is_wetland,
								// $row->uncertainty);

    }

		mysqli_stmt_free_result($stmt);
	  mysqli_close($this->connection);

	  return $rows;
	}

	/**
	 * Returns the item corresponding to the value specified for the primary key.
	 *
	 * @return stdClass
	 */
	private function getPlotsByID($itemID) {
		$this->connect();
		$stmt = mysqli_prepare($this->connection, "SELECT * FROM $this->tablename where plotid=?");
		$this->throwExceptionOnError();

		mysqli_stmt_bind_param($stmt, 'i', $itemID);
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();

		mysqli_stmt_bind_result($stmt, $row->plotid, $row->x, $row->y, $row->is_processed, $row->is_example, $row->comment);

		if(mysqli_stmt_fetch($stmt)) {
	      return $row;
		} else {
	      return null;
		}
	}

	/**
	 * Returns the item corresponding to the value specified for the primary key.
	 *
	 * @return stdClass
	 */
	private function createPlots($item) {
		$this->connect();
		$stmt = mysqli_prepare($this->connection, "INSERT INTO $this->tablename (plotid, x, y, is_processed, is_example, comment) VALUES (?, ?, ?, ?, ?, ?)");
		$this->throwExceptionOnError();

		mysqli_stmt_bind_param($stmt, 'iddiis', $item->plotid, $item->x, $item->y, $item->is_processed, $item->is_example, $item->comment);
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();

		$autoid = mysqli_stmt_insert_id($stmt);

		mysqli_stmt_free_result($stmt);
		mysqli_close($this->connection);

		return $autoid;
	}

	/**
	 * Updates the passed item in the table.
	 *
	 * @param stdClass $item
	 * @return void
	 */
	private function updatePlots($item) {
		$this->connect();
		$stmt = mysqli_prepare($this->connection, "UPDATE $this->tablename SET plotid=?, x=?, y=?, is_processed=?, is_example=?, comment=? WHERE plotid=?");
		$this->throwExceptionOnError();

		mysqli_stmt_bind_param($stmt, 'iddiisi', $item->plotid, $item->x, $item->y, $item->is_processed, $item->is_example, $item->comment, $item->plotid);
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();

		mysqli_stmt_free_result($stmt);
		mysqli_close($this->connection);
	}

	/**
	 * Deletes the item corresponding to the passed primary key value from
	 * the table.
	 *
	 * @return void
	 */
	private function deletePlots($itemID) {
		$this->connect();
		$stmt = mysqli_prepare($this->connection, "DELETE FROM $this->tablename WHERE plotid = ?");
		$this->throwExceptionOnError();

		mysqli_stmt_bind_param($stmt, 'i', $itemID);
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();

		mysqli_stmt_free_result($stmt);
		mysqli_close($this->connection);
	}


	/**
	 * Returns the number of rows in the table.
	 *
	 * @return void
	 */
	public function count() {
		$this->connect();
		$stmt = mysqli_prepare($this->connection, "SELECT COUNT(*) AS COUNT FROM $this->tablename");
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();

		mysqli_stmt_bind_result($stmt, $rec_count);
		$this->throwExceptionOnError();

		mysqli_stmt_fetch($stmt);
		$this->throwExceptionOnError();

		mysqli_stmt_free_result($stmt);
		mysqli_close($this->connection);

		return $rec_count;
	}

}

?>
