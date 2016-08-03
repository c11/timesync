<?php
/**
 * Created by PhpStorm.
 * User: yang
 * Date: 11/18/15
 * Time: 11:01 AM
 */

require_once 'services/RegionSpectralService.php';


$null_obj = array('error'=>1, 'message'=>'critical parameter missing', 'data'=>0);


if (!isset($_REQUEST['tsa']) || !isset($_REQUEST['project_id']) || !isset($_REQUEST['interpreter']) || !isset($_REQUEST['plotid'])) {
    echo json_encode($null_obj);
}

$service = new RegionSpectralService();

$project_id = $_REQUEST['project_id'];
$tsa = $_REQUEST['tsa'];
$interpreter = $_REQUEST['interpreter'];
$plot_id = $_REQUEST['plotid'];

if (isset($_REQUEST['year'])) {
    $spectrals = $service->getAllRegionSpectralByPlotForYear($project_id, $tsa, $plot_id, $_REQUEST['year']);
}
else {
    $spectrals = $service->getRegionSpectralByPlot($project_id, $tsa, $plot_id);

}


echo json_encode($spectrals);

