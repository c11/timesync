<?php

require_once "BaseService.php";

/**
 *  Plot related service
 */
class ProjectService extends BaseService {

	/**
	 * Constructor
	 */
	public function __construct() {
		$this->tablename = "projects";
	}

	/**
	 * Returns all the rows from the table.
	 *
	 * @return array
	 */
	public function getAllProject() {
		$sql = <<<DOQ
			SELECT project_id, project_code,
						 project_name, description,
						 contact, plot_size
			FROM $this->tablename
DOQ;

		$this->connect();
		$stmt = mysqli_prepare($this->connection, $sql);
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();

		$rows = array();

		mysqli_stmt_bind_result($stmt,
								$row->project_id,
								$row->project_code,
								$row->project_name,
								$row->description,
								$row->contact,
								$row->plot_size
								);

	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
		  mysqli_stmt_bind_result($stmt,
								$row->project_id,
								$row->project_code,
								$row->project_name,
								$row->description,
								$row->contact,
								$row->plot_size
								);

	    }

			mysqli_stmt_free_result($stmt);
	    mysqli_close($this->connection);

	    return $rows;
	}

	/**
	 * create new project
	 *
	 * @param stdClass $project
	 * @return int
	 */
	public function createProject($project) {
		$sql = <<<DOQ
			INSERT INTO projects (project_code, project_name, description, contact)
			VALUES (?,?,?,?)
DOQ;

		$this->connect();

		$stmt = mysqli_prepare($this->connection, $sql);
		$this->throwExceptionOnError();

		mysqli_bind_param($stmt, 'ssss',
										  $project->project_code,
										  $project->project_name,
										  $project->description,
										  $project->contact);
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();

		$autoid = mysqli_stmt_insert_id($stmt);

		mysqli_stmt_free_result($stmt);
		mysqli_close($this->connection);

		return $autoid;
	}


	/**
	 * Update project
	 *
	 * @param stdClass $project
	 * @return void
	 */
	public function updateProject($project) {
		$sql = <<<DOQ
			UPDATE projects
			SET project_code=?,
					project_name=?,
					description=?,
					contact=?
DOQ;

		$this->connect();
		$stmt = mysqli_prepare($this->connection, $sql);
		$this->throwExceptionOnError();

		mysqli_stmt_bind_param($stmt, 'ssss',
													 $project->project_code,
													 $project->project_name,
													 $project->description,
													 $project->contact);
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();

		mysqli_stmt_free_result($stmt);
		mysqli_close($this->connection);
	}

	/**
	 * add tsa to project
	 *
	 * @param int $project_id
	 * @param int $tsa
	 * @return void
	 */
	public function addProjectTsa($project_id, $tsa) {
		$sql = "INSERT INTO project_tsa (project_id, tsa) VALUES (?,?)";

		$this->connect();

		$stmt = mysqli_prepare($this->connection, $sql);
		$this->throwExceptionOnError();

		mysqli_bind_param($stmt, 'ii', $project_id, $tsa);
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();

		mysqli_stmt_free_result($stmt);
		mysqli_close($this->connection);
	}

	/**
	 * Returns the item corresponding to the value specified for the primary key.
	 *
	 * @param int $project_id
	 * @return array
	 */
	public function getProjectTsa($project_id) {
		$sql = <<<DOQ
			SELECT project_id, tsa
			FROM project_tsa
			WHERE project_id = ?
DOQ;

		$this->connect();
		$stmt = mysqli_prepare($this->connection, $sql);
		$this->throwExceptionOnError();

		mysqli_stmt_bind_param($stmt, 'i', $project_id);
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();

		$rows = array();
		mysqli_stmt_bind_result($stmt, $row->project_id, $row->tsa);

	  while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
				mysqli_stmt_bind_result($stmt, $row->project_id, $row->tsa);
	  }

		mysqli_stmt_free_result($stmt);
	  mysqli_close($this->connection);

	  return $rows;
	}

	/**
	 * assign interpreter
	 *
	 * @param int $project_id
	 * @param int $tsa
	 * @param int $interpreter
	 * @return void
	 */
	public function assignInterpreter($project_id, $tsa, $interpreter) {
		$sql = <<<DOQ
			INSERT INTO project_interpreter
				(project_id, tsa, interpreter, start_date)
			VALUES (?,?,?,now())
DOQ;

		$this->connect();

		$stmt = mysqli_prepare($this->connection, $sql);
		$this->throwExceptionOnError();

		mysqli_bind_param($stmt, 'iii', $project_id, $tsa, $interpreter);
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();

		mysqli_stmt_free_result($stmt);
		mysqli_close($this->connection);
	}

	/**
	 * get projects and tsa for current user
	 *
	 * @param int $interpreter
   * @param int $role
	 * @return array
	 */
	public function getUserTasks($interpreter, $role) {
		$sql = <<<DOQ
			SELECT projects.project_id, project_code, project_name,
						 description, contact, tsa, user_id, plot_size,
						 group_concat(packet_id separator ',') as packet_ids
			FROM projects, interpreter, project_interpreter
			WHERE projects.project_id = project_interpreter.project_id
			AND project_interpreter.interpreter = interpreter.user_id
			AND interpreter.user_id = ?
            AND isactive = 1
			GROUP BY projects.project_id, project_code, project_name,
						 description, contact, tsa, user_id, plot_size
			ORDER BY packet_id
DOQ;

		$sqlread = <<<DOQ
			SELECT distinct projects.project_id, project_code, project_name,
				 description, contact, tsa, $interpreter as user_id, plot_size
			FROM projects, project_interpreter
			WHERE projects.project_id = project_interpreter.project_id
			ORDER BY project_code
DOQ;

		// if ($interpreter<=5 || $interpreter==9999) {
		// 	$sql = $sqlread;
		// }

		$this->connect();
		$stmt = mysqli_prepare($this->connection, $sql);
		$this->throwExceptionOnError();

		// if ($interpreter!=9999 && $interpreter>5) {
			mysqli_stmt_bind_param($stmt, 'i', $interpreter);
			$this->throwExceptionOnError();
		// }

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();

		$rows = array();
		mysqli_stmt_bind_result($stmt,
														$row->project_id,
														$row->project_code,
														$row->project_name,
														$row->description,
														$row->contact,
														$row->tsa,
														$row->user_id,
														$row->plot_size
														);

	  while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
				mysqli_stmt_bind_result($stmt,
														$row->project_id,
														$row->project_code,
														$row->project_name,
														$row->description,
														$row->contact,
														$row->tsa,
														$row->user_id,
														$row->plot_size
														);
	  }

		mysqli_stmt_free_result($stmt);
	  mysqli_close($this->connection);

	  return $rows;
	}


}

?>
