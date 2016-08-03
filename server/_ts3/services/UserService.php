<?php

require_once "BaseService.php";

/**
 *  Plot related service
 */
class UserService extends BaseService {

	/**
	 * Constructor
	 */
	public function __construct() {
		$this->tablename = "interpreter";
	}

	/**
	 * Returns all the rows from the table.
	 *
	 * @return array
	 */
	public function getAllInterpreter() {
		$sql = <<<DOQ
			SELECT user_id, user_name,
						 first_name, last_name,
						 password
			FROM $this->tablename
DOQ;

		$this->connect();
		$stmt = mysqli_prepare($this->connection, $sql);
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();

		$rows = array();
		mysqli_stmt_bind_result($stmt,
														$row->user_id,
														$row->user_name,
														$row->first_name,
														$row->last_name,
														$row->password);

	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();

				mysqli_stmt_bind_result($stmt,
														$row->user_id,
														$row->user_name,
														$row->first_name,
														$row->last_name,
														$row->password);
	    }

			mysqli_stmt_free_result($stmt);
	    mysqli_close($this->connection);

	    return $rows;
	}

	/**
	 * get user by credential
	 *
	 * @param string $user_name
	 * @param string $pass
	 * @return stdClass
	 */
	public function getUserByCredential($user_name, $pass) {
		$sql = <<<DOQ
			SELECT user_id, user_name, first_name, last_name, password
			FROM interpreter
			WHERE user_name=?
			AND password=sha1(?)
DOQ;

		$this->connect();
		$stmt = mysqli_prepare($this->connection, $sql);
		$this->throwExceptionOnError();

		mysqli_stmt_bind_param($stmt, 'ss', $user_name, $pass);
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();

		mysqli_stmt_bind_result($stmt,
														$row->user_id,
														$row->user_name,
														$row->first_name,
														$row->last_name,
														$row->password);
	  if (mysqli_stmt_fetch($stmt)) {
	  	return $row;
	  }
		else {
			return null;
		}
	}

	/**
	 * add new user
	 *
	 * @param stdClass $interpreter
	 * @return int
	 */
	public function addUser($interpreter) {
		$sql = <<<DOQ
			INSERT INTO interpreter (user_name, first_name, last_name, password)
			VALUES (?,?,?,sha1(?))
DOQ;

		$this->connect();

		$stmt = mysqli_prepare($this->connection, $sql);
		$this->throwExceptionOnError();

		mysqli_bind_param($stmt, 'ssss',
											$interpreter->user_name,
											$interpreter->first_name,
											$interpreter->last_name,
											$interpreter->password);
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();

		$autoid = mysqli_stmt_insert_id($stmt);

		mysqli_stmt_free_result($stmt);
		mysqli_close($this->connection);

		return $autoid;
	}
}

?>
