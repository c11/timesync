<?php

require_once "BaseService.php";

/**
 *  Plot related service
 */
class SpectralPropertyService extends BaseService {
	/**
	 * Constructor
	 */
	public function __construct() {
		$this->tablename = "spectral_properties";
	}
	
	/**
	 * Returns all spectral properties
	 *
	 * @return array
	 */
	public function getSpectralProperties() {
		$this->connect();
		
		$sql = <<<DOQ
			SELECT spectral_id, spectral_name, 
			       spectral_min, spectral_mean, spectral_max, spectral_std
			FROM $this->tablename
			ORDER BY spectral_id
DOQ;

		$stmt = mysqli_prepare($this->connection, $sql);		
		$this->throwExceptionOnError();
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();
		
		$rows = array();
		
		mysqli_stmt_bind_result($stmt, $row->spectral_id,
								$row->spectral_name, $row->spectral_min,
								$row->spectral_mean, $row->spectral_max,
								$row->spectral_std);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
				mysqli_stmt_bind_result($stmt, $row->spectral_id,
								$row->spectral_name, $row->spectral_min,
								$row->spectral_mean, $row->spectral_max,
								$row->spectral_std);
		}
		
		mysqli_stmt_free_result($stmt);
	  mysqli_close($this->connection);
	  return $rows;
	}
}

?>
