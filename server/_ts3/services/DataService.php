<?php

require_once "BaseService.php";

/**
 *  Data Export/Import service
 */
class DataService extends BaseService {

	/**
	 * Constructor
	 */
	public function __construct() {
		$this->tablename = "v_ts_segments";
	}

	/**
	 * Returns all the rows from the table.
	 *
	 * @param int $project_id project identifier
	 * @param int $interpreter interpreter identifier
	 * @return void
	 */
	public function exportSegments($project_id, $interpreter) {
		$sql = <<<DOQ
			SELECT plotid, start_year, end_year, 
						 change_process, duration, start_lu, end_lu
			FROM $this->tablename
      WHERE project_id = $project_id
      AND interpreter = $interpreter
      ORDER BY tsa, plotid, start_year
DOQ;
    	$sql = <<<DOQ
			SELECT tsa, plotid, image_year, image_julday, 
						 dominant_landuse, dominant_landcover, change_process
			FROM vertex
      WHERE project_id = $project_id
      AND interpreter = $interpreter
      ORDER BY tsa, plotid, image_year
DOQ;

	$this->connect();

    $this->throwExceptionOnError();

    $result = mysqli_query($this->connection, $sql);

    $csvoutput = fopen('php://output', 'w');
    $row = $result->fetch_assoc();
    $headers = array_keys($row);
    fputcsv($csvoutput, $headers);
    fputcsv($csvoutput, $row);
    
    while ($row = $result->fetch_assoc()) {
      fputcsv($csvoutput, $row);
    }
    fclose($csvoutput);
	}

	/**
	* Register user
	* This function is for the training site, where a self-registered user will automatically 
	* get access to all the existing plots.
	* 
	* return value: -1: user already exists; 0: success; 1: registration failed.
	*
	* @param string $user user name this should be email address.
	* @param string $first_name first name
	* @param string $last_name last name
	* @param string $pass password
	* @return int
	*/
	public function registerUser($user, $pass, $first_name='', $last_name='') {
		$sql = "CALL register_user('$user', '$pass', '$first_name', '$last_name')";

		try {
			$this->connect();
			$this->throwExceptionOnError();

			$result = mysqli_query($this->connection, $sql);

			$row = $result->fetch_row();

			return $row[0];

		}
		catch (Exception $e) {
			return 1;
		}
	}

}

?>
