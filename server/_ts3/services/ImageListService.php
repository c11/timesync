<?php

require_once "BaseService.php";

/**
 *  Plot related service
 */
class ImageListService extends BaseService {
	
	/**
	 * Constructor
	 */
	public function __construct() {
		$this->tablename = "image_list";
	}
	
	/**
	 * Returns all the image list.
	 *
	 * @param int $project_id
	 * @param int $tsa
	 * @return array
	 */
	public function getImageList($project_id, $tsa) {
		$sql = <<<DOQ
			SELECT project_id, tsa, imgtype, imgyear, imgday 
			FROM $this->tablename 
			WHERE project_id=$project_id
			AND tsa=$tsa
			ORDER BY imgyear, imgday
DOQ;
 
		$this->connect();
		$stmt = mysqli_prepare($this->connection, $sql);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		
		mysqli_stmt_bind_result($stmt, $row->project_id, $row->tsa,
														$row->type, $row->year, $row->julday);
		
	  while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
				mysqli_stmt_bind_result($stmt, $row->project_id, $row->tsa,
														$row->type, $row->year, $row->julday);
		}
		
		mysqli_stmt_free_result($stmt);
	  mysqli_close($this->connection);
	
	  return $rows;
	}
}

?>
