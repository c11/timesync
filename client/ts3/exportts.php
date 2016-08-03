<?php
set_include_path(get_include_path() . PATH_SEPARATOR . '/var/www/timesync/__y/services');
require_once 'DataService.php';

require '../__y/vendor/autoload.php';
require_once '../__y/config.php';
use \Firebase\JWT\JWT;

$segment_file = 'ts_vertex.csv';
header('Content-Type: text/csv');
header("Content-Disposition: attachment;filename=$segment_file");
header('Cache-Control: no-cache, no-store, must-revalidate');
header('Pragma: no-cache');
header('Expires: 0');


$headers = apache_request_headers();

$authHeader = $_GET['t'];

if ($authHeader) {
	list($jwt) = sscanf($authHeader, '%s');

	if ($jwt) {
	  try {
	    $secretKey = base64_encode(TimeSyncSettings::JWT_KEY);
	    $token = JWT::decode($jwt, $secretKey, array('HS256'));
	  }
	  catch (Exception $e) {
	  	echo "Not authorized.";
	  	exit;
	  }
	}
	else {
		echo "Not authorized.";
		exit;
	}
}
else {
	echo "Not authorized.";
	exit;
}

//retrieve project id
$project_id = $_REQUEST['pid'];
$interpreter = $_REQUEST['uid'];

$dataservice = new DataService();
$dataservice->exportSegments($project_id, $interpreter);

?>