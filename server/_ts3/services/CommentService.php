<?php

require_once "BaseService.php";

/**
 *  Plot related service
 */
class CommentService extends BaseService {
	/**
	 * Constructor
	 */
	public function __construct() {
		$this->tablename = "plot_comments";
	}

	/**
	 * create vertices for specified plot
	 *
	 * @param int $project_id project identifier
	 * @param int $tsa scene
	 * @param int $plotid plot identifier
	 * @param int $interpreter
	 * @param string $comment value string for insertion
	 * @param int $is_example
	 * @param int $is_complete
	 * @return int
	 */
	public function createComments($project_id, $tsa, $plotid, $interpreter, $comment, $is_complete=0, $is_example=0, $is_wetland=0, $uncertainty=0) {
		try {
			$this->connect(FALSE);

		$es_comment = mysqli_real_escape_string($this->connection, $comment);

		$update_sql = <<<DOQ
			INSERT INTO $this->tablename
			 (project_id, tsa, plotid, interpreter, comment, is_example, is_complete, is_wetland, uncertainty)
			 VALUES ($project_id, $tsa, $plotid, $interpreter, '$es_comment', $is_example, $is_complete, $is_wetland, $uncertainty)
			 ON DUPLICATE KEY UPDATE comment = '$es_comment', is_example=$is_example, is_complete=$is_complete, is_wetland=$is_wetland, uncertainty=$uncertainty
DOQ;

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
	 * Return all vertices for a given plot
	 *
	 * @param int $project_id project identifier
	 * @param int $tsa scene
	 * @param int $plotid plot identifier
	 * @param int $interpreter
	 * @return stdClass
	 */
	 public function getComment($project_id, $tsa, $plotid, $interpreter) {
		$this->connect();

		$sql = <<<DOQ
			SELECT project_id, tsa, plotid, interpreter, comment, is_example, is_complete, is_wetland, uncertainty
			FROM plot_comments
			WHERE project_id=$project_id
			AND tsa=$tsa
			AND plotid = $plotid
DOQ;

		$where = " AND interpreter=$interpreter LIMIT 1";
		if ($interpreter<=5 || $interpreter==9999) {
			$where = " LIMIT 1";
		}

		$sql = $sql . $where;

		$stmt = mysqli_prepare($this->connection, $sql);
		$this->throwExceptionOnError();

		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError();

		mysqli_stmt_bind_result($stmt,
								$row->project_id,
								$row->tsa,
								$row->plotid,
								$row->interpreter,
								$row->comment,
								$row->is_example,
								$row->is_complete,
								$row->is_wetland,
								$row->uncertainty);

		mysqli_stmt_fetch($stmt);
	  return $row;
	}

}

?>
