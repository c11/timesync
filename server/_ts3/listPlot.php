<?php
/**
 * Created by PhpStorm.
 * User: yang
 * Date: 11/18/15
 * Time: 10:30 AM
 */


require_once 'services/PlotsService.php';


$null_obj = array('error'=>1, 'message'=>'critical parameter missing', 'data'=>0);


if (!isset($_REQUEST['tsa']) || !isset($_REQUEST['project_id']) || !isset($_REQUEST['interpreter'])) {
    echo json_encode($null_obj);
}

$service = new PlotsService();

$project_id = $_REQUEST['project_id'];
$tsa = $_REQUEST['tsa'];
$interpreter = $_REQUEST['interpreter'];

$plots = $service->getAllPlots($project_id, $tsa, $interpreter);

echo json_encode($plots);