<?php

require_once "BaseService.php";

/**
 *  Plot related service
 */
class ResponseDesignService extends BaseService {
	/**
	 * Constructor
	 */
	public function __construct() {
		$this->tablename = "response_link";
	}

	public function getResponseDesign($project_id) {
		$sql = <<<DDD
        SELECT p.response_type, p.code, p.identifier, p.label,
        s.code as note_code,s.identifier as note_identifier, s.label as note_label
        FROM ts3test.response_config p, ts3test.response_config s, response_link rl
        WHERE p.config_id = rl.parent_config_id
        AND s.config_id = rl.child_config_id
        AND p.project_id = s.project_id
        AND p.project_id = rl.project_id
        AND p.project_id = $project_id
        ORDER BY p.response_type
DDD;

        $this->connect();
        $stmt = mysqli_prepare($this->connection, $sql);
        $this->throwExceptionOnError();

        mysqli_stmt_execute($stmt);
        $this->throwExceptionOnError();

        $rows = array();

        mysqli_stmt_bind_result($stmt, $row->type,
            $row->code,
            $row->identifier,
            $row->label,
            $row->note_code,
            $row->note_identifier,
            $row->note_label);

        while (mysqli_stmt_fetch($stmt)) {
            $rows[] = $row;
            $row = new stdClass();
            mysqli_stmt_bind_result($stmt, $row->type,
                $row->code,
                $row->identifier,
                $row->label,
                $row->note_code,
                $row->note_identifier,
                $row->note_label);
        }

        return $rows;

	}


}

?>
