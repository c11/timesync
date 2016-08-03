<?php
	require '../_ts3/vendor/autoload.php';
	require_once '../_ts3/config.php';
	use \Firebase\JWT\JWT;

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
?>
<!DOCTYPE html>
<html lan="en">
	<head>
		<title>TimeSync</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge"> <!--needed so that D3 will work in IE!-->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="timesync_style.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.6/d3.min.js" charset="utf-8"></script>
		<script type="text/javascript" src="jquery.mousewheel.min.js"></script>
		<script type="text/javascript" src="specIndexStretch.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.imagesloaded/3.2.0/imagesloaded.pkgd.min.js"></script>

		<script>
		var userID = '<?php echo $token->data->userId; ?>';
		var authHeader = '<?php echo $authHeader;?>';
		</script>
	</head>
	<body>
		<div id="topSection">
			<p id="title" style="display:inline-block;">TimeSync - v3.0</p>
			<p style="display:inline-block;">Project:</p>
			<div class="dropdown" style="display:inline-block; margin-right:15px;">
				<button id="projBtn" class="btn btn-default btn-xs dropdown-toggle" type="button" data-toggle="dropdown" style="font-size:11px; margin-bottom:2px; height:21.7167px; width:100px; text-align: left;">
					<span class="caret projBtn"></span>
				</button>
				<ul id="projectList" class="dropdown-menu">
<!-- 				<li>Fill on the fly 1</li>
					<li>Fill on the fly 2</li>
					<li>Fill on the fly 3</li> -->
				</ul>
			</div>
			<div id="chipOptionHolder">
				<div class="chipOptions" id="chipSizeDiv">
					<p style="display:inline-block;">Chip Size:</p>
						<input id="chipSize" autocomplete="off" type="number" name="chipSize" min="135" max="255" step="10" value="195">
				</div>
				<div class="chipOptions" id="plotSizeDiv" style="display:none;">
					<p style="display:inline-block;">Plot Size:</p>
						<input id="plotSize" autocomplete="off" type="number" name="plotSize" min="1" max="5" step="2" value="1">
				</div>
				<div class="chipOptions">
					<p style="display:inline-block;">Zoom: </p>
					<span class="glyphicon glyphicon-minus"></span>
						<input id="zoomSize" autocomplete="off" type="range" name="zoomSize" min="0" max="40" value="20">
					<span class="glyphicon glyphicon-plus"></span>
				</div>
				<div class="chipOptions colorOptions" style="display:none;">
					<input id="selectedColor" autocomplete="off" type="color" name="selectedColor" value="#ED2939">
					<p style="display:inline-block;">Selected</p>						
				</div>
				<div class="chipOptions colorOptions" style="display:none;">
					<input id="highlightColor" autocomplete="off" type="color" name="highlightColor" value="#32CD32">
					<p style="display:inline-block;">Highlight</p>						
				</div>
				<div class="chipOptions colorOptions" style="display:none;">
					<input id="plotColor" autocomplete="off" type="color" name="plotColor" value="#FFFFFF">    <!--#ED2939-->
					<p style="display:inline-block;">Plot</p>
				</div>
			</div>
			<!--<button id="btnDoyCal" type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#doyCalModal">Calendar</button> -->
			<!--<button id="btnDoyCal" type="button" class="btn btn-default btn-sm">Calendar</button>-->	
			<!--<button id="btnTsGuide" type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#tsGuideModal">TS Guide</button> -->
			<!--<button id="saveBtn" class="btn btn-default btn-xs" type="button" style="margin-right:15px; font-size:11px; margin-bottom:2px; height:21.7167px; text-align: left;">Save</button>-->
			
			<div class="dropdown" style="display:inline-block; margin-right:15px;">
				<button id="helpBtn" class="btn btn-default btn-xs dropdown-toggle" type="button" data-toggle="dropdown" style="font-size:11px; margin-bottom:2px; height:21.7167px; text-align: left;"> <!--; width:50px-->
					Help
				</button>
				<ul id="helpList" class="dropdown-menu">
					<li id="doyCalLi">Calendar</li>
					<li id="RDLi">Response Design</li>					
					<li><a target='_blank' href="TimeSync-How-To-Guide-V1.0.0.pdf">UI Guide</a></li>
					<li id="toolTips">Tool Tips<span id="toolTipsCheck" class="glyphicon glyphicon-none" style="margin-left:4px"></span></li>
				</ul>
			</div>

			<button id="exportBtn" class="btn btn-default btn-xs dropdown-toggle" type="button" data-toggle="dropdown" style="font-size:11px; margin-bottom:2px; height:21.7167px; text-align: left;">
				Export Data
			</button>

		</div>
		
		<div id="containerDiv">
			<div id="plotSelectionDiv" class="sectionDiv">
				<p class="header">Plots</p>
				<ul id="plotList"> <!-- the <li>'s will be filled in on-the-fly -->
<!-- 					<li class="selected">12312
					<li>456
					<li>789
					<li>456 -->
				</ul>
			</div>
			<div id="plot" class="sectionDiv">
				<p class="header">Spectral Trajectory</p> <!--<span id="expandTrajPlot" class="glyphicon glyphicon-new-window right-align" style="float:right; margin:3px; cursor:pointer"></span>-->
				<svg id="svg" width="740" height="250"></svg>
				<div class="btn-group" role="group" aria-label="..." style="margin:-1px; display: inline-block;">
					<div class="btn-group specPlotDrop" role="group">	
						<button id="btnIndex" class="btn btn-default dropdown-toggle specPlotBtn" type="button">
							<div><strong>Index/Band</strong>:<br><small>TC Wetness</small><span class="caret specPlot"></span></div>
						</button>
						<ul class="dropdown-menu specPlot" id="indexList">
							<li id="B1">Band 1</li>
							<li id="B2">Band 2</li>
							<li id="B3">Band 3</li>
							<li id="B4">Band 4</li>
							<li id="B5">Band 5</li>
							<li id="B7">Band 7</li>
							<li id="TCB">TC Brightness</li>
							<li id="TCG">TC Greenness</li>
							<li class="active" href="#" id="TCW">TC Wetness</li>
							<li id="TCA">TC Angle</li>
							<li id="NDVI">NDVI</li>
							<li id="NBR">NBR</li>
						</ul>
					</div>
					<div id="btnRed" class="btn-group specPlotDrop" role="group" style="display:none">					
						<button class="btn btn-default dropdown-toggle specPlotBtn" type="button">
							<div><strong>R</strong><small>GB</small>:<br><small>TC Brightness</small><span class="caret specPlot"></span></div>
						</button>
						<ul class="dropdown-menu specPlot rgb" id="redList">
							<li href="#" id="B1">Band 1</li>
							<li href="#" id="B2">Band 2</li>
							<li href="#" id="B3">Band 3</li>
							<li href="#" id="B4">Band 4</li>
							<li href="#" id="B5">Band 5</li>
							<li href="#" id="B7">Band 7</li>
							<li class="active" href="#" id="TCB">TC Brightness</li>
							<li href="#" id="TCG">TC Greenness</li>
							<li href="#" id="TCW">TC Wetness</li>
							<li href="#" id="TCA">TC Angle</li>
							<li href="#" id="NDVI">NDVI</li>
							<li href="#" id="NBR">NBR</li>
						</ul>
					</div>
					<div class="btn-group specPlotDrop" role="group" style="display:none">
						<button id="btnGreen" class="btn btn-default dropdown-toggle specPlotBtn" type="button">
							<div><small>R</small><strong>G</strong><small>B</small>:<br><small>TC Greenness</small><span class="caret specPlot"></span></div>
						</button>
						<ul class="dropdown-menu specPlot rgb" id="greenList">
							<li href="#" id="B1">Band 1</li>
							<li href="#" id="B2">Band 2</li>
							<li href="#" id="B3">Band 3</li>
							<li href="#" id="B4">Band 4</li>
							<li href="#" id="B5">Band 5</li>
							<li href="#" id="B7">Band 7</li>
							<li href="#" id="TCB">TC Brightness</li>
							<li class="active" href="#" id="TCG">TC Greenness</li>
							<li href="#" id="TCW">TC Wetness</li>
							<li href="#" id="TCA">TC Angle</li>
							<li href="#" id="NDVI">NDVI</li>
							<li href="#" id="NBR">NBR</li>
						</ul>
					</div>
					<div class="btn-group specPlotDrop" role="group" style="display:none">
						<button id="btnBlue" class="btn btn-default dropdown-toggle specPlotBtn" type="button">
							<div><small>RG</small><strong>B</strong>:<br><small>TC Wetness</small><span class="caret specPlot"></span></div>
						</button>
						<ul class="dropdown-menu specPlot rgb" id="blueList">
							<li href="#" id="B1">Band 1</li>
							<li href="#" id="B2">Band 2</li>
							<li href="#" id="B3">Band 3</li>
							<li href="#" id="B4">Band 4</li>
							<li href="#" id="B5">Band 5</li>
							<li href="#" id="B7">Band 7</li>
							<li href="#" id="TCB">TC Brightness</li>
							<li href="#" id="TCG">TC Greenness</li>
							<li class="active" href="#" id="TCW">TC Wetness</li>
							<li href="#" id="TCA">TC Angle</li>
							<li href="#" id="NDVI">NDVI</li>
							<li href="#" id="NBR">NBR</li>
						</ul>
					</div>
					<div class="btn-group" role="group">
						<button id="btnLine" class="btn btn-default specPlotBtn" type="button">
							<Strong>Show Line</strong><br><span id="lineDisplayThumb" class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
						</button>
					</div>
 					<div class="btn-group" role="group">
						<button id="btnPoints" class="btn btn-default specPlotBtn" type="button">
							<Strong>Show All</strong><br><span id="allPointsDisplayThumb" class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span>
						</button>
					</div>
 					<div class="btn-group" role="group">
						<button id="btnResetGlobal" class="btn btn-default specPlotBtn" type="button">
							<Strong>Global Stretch</strong><br><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>	
						</button>
					</div>
					 <div class="btn-group" role="group">
						<button id="btnResetLocal" class="btn btn-default specPlotBtn" type="button">
							<Strong>Local Stretch</strong><br><span class="glyphicon glyphicon-repeat" aria-hidden="true"></span>	
						</button>
					</div>
<!-- 					<div class="btn-group" role="group">
						<button id="btnExpand" class="btn btn-default specPlotBtn" type="button">
							<Strong>Expand Plot</strong><br><span id="allPointsDisplayThumb" class="glyphicon glyphicon-new-window" aria-hidden="true"></span>	
						</button>
					</div> -->
				</div>
			</div>
			
			
			<div id="formsDiv" class="sectionDiv">
				<p class="header">Interpretation Forms</p>
				<ul class="test">
					<li id="segmentsFormTab" class="selected" style="border-top-left-radius:4px; text-align:center;">Segments
					<li id="verticesFormTab" class="unselected" style="margin-left:-1px; text-align:center;">Vertices
					<li id="CommentsFormTab" class="unselected" style="margin-left:-1px; border-top-right-radius:4px; text-align:center;">Comments
				</ul>
				
				<div id="segmentsFormDiv">
					<table id="segmentsFormTbl">
						<col width="19">
						<col width="38">
						<col width="38">
						<tr class="trHeader">
							<th></th>
							<th>Start</th>
							<th>End</th>		
							<th>Change Process</th>
						</tr>
<!-- 						<tr class="segment">
							<td class="highlightIt"><span class="glyphicon glyphicon-search"></span></td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>		
							<td class="changeProcessInput formDrop"></td>
						</tr> -->
					</table>					
				</div>
								
				<div id="changeProcessDiv" class="dropThis">
<!-- 					<p class="subHeader">Change process:</p> -->
<!-- 					<div id="changeProcessSelection" class="formDropSelection" align="center"><span class="glyphicon glyphicon-triangle-bottom"></span></div> --> <!-- <div id="theSelection"></div> -->
					<p class="subHeader" style="margin-top:3px">Change Process:</p>

					<ul id="changeProcessList">
						<li id="fire">Fire</li>
						<li id="harvest">Harvest</li>
						<li id="decline">Decline</li>
						<li id="wind">Wind</li>
						<li id="hydro">Hydrology</li>
						<li id="debris">Debris</li>
						<li id="growth">Growth</li>
						<li id="stable">Stable</li>
						<li id="conversion">Conversion</li>
						<li id="otherCP">Other</li>
					</ul>

 					<p class="subHeader">Notes:</p>
					<ul id="CPnotesList" class="notesList">
						<li><input id="natural" class="natural forFire" type="checkbox" name="changeProcess" value="natural" autocomplete="off"> Natural</li>
						<li><input id="clearcut" class="clearcut forHarvest" type="checkbox" name="changeProcess" value="clearcut" autocomplete="off"> Clearcut</li>
						<li><input id="thinning" class="thinning forHarvest" type="checkbox" name="changeProcess" value="thinning" autocomplete="off"> Thinning</li>
						<li><input id="prescribed" class="prescribed forFire" type="checkbox" name="changeProcess" value="prescribed" autocomplete="off"> Prescribed</li>
						<li><input id="sitePrepFire" class="sitePrepFire forFire forHarvest" type="checkbox" name="changeProcess" value="sitePrepFire" autocomplete="off"> Site-prep fire</li>
						<li><input id="flooding" class="flooding forHydro" type="checkbox" name="changeProcess" value="flooding" autocomplete="off"> Flooding</li>
						<li><input id="reserviorLakeFlux" class="reserviorLakeFlux forHydro" type="checkbox" name="changeProcess" value="reserviorLakeFlux" autocomplete="off"> Reservoir/Lake flux</li>
						<li><input id="wetlandDrainage" class="wetlandDrainage forConserv" type="checkbox" name="changeProcess" value="wetlandDrainage" autocomplete="off"> Wetland drainage</li>
						<li><input id="airphotoOnly" class="airphotoOnly forFire forHarvest forDecline forWind forHydro forDebris forGrowth forStable forConserv forOther" type="checkbox" name="changeProcess" value="airphotoOnly" autocomplete="off"> Airphoto only</li>
					</ul>
					<!-- <div id="changeProcessDoneBtn" class="doneBtn">Done</div> -->
				</div>
				
				
				
				<div id="verticesFormDiv">						
					<table id="verticesFormTbl">
						<col width="19">
						<col width="38">
						<col width="140">
						<tr class="trHeader">
							<th></th>
							<th>Year</th>
							<th>Land Use</th>
							<th>Land Cover</th>
						</tr>
<!-- 						<tr class="vertex">
							<td class="highlightIt"><span class="glyphicon glyphicon-search"></span></td>
							<td></td>
							<td class="landUseInput formDrop lulc"></td>	
							<td class="landCoverInput formDrop lulc"></td>								
						</tr> -->
					</table>
				</div>
				
				<div id="lulc" class="dropThis">
					<table 	style="border:none;">
 						<tr>
							<td style="padding:0px 0px 0px 0px; border:none;">
								<div id="landUseDiv" style="margin:4px 2px 0px 4px;" >  <!-- class="dropThis" -->
								<!-- <div id="landUseSelection" class="formDropSelection" align="center"><span class="glyphicon glyphicon-triangle-bottom"></span></div> --> <!-- <div id="theSelection"></div> -->
									<p class="subHeader">Land Use:</p> <!--<span id="luSecondIcon" class="glyphicon glyphicon-star" style="float:right;margin-right:6px;margin-top:2px;"> -->
									
									<ul id="luLevelSwitchHolder" class="lulcLevelSwitchHolder">
										<li id="LUprimaryTab" class="selected" style="border-top-left-radius:4px; text-align:center;">Primary
										<li id="LUsecondaryTab" style="margin-left:-1px; border-top-right-radius:4px; text-align:center;">Secondary
									</ul>

									<!--<div id="luLevelSwitchHolder">
										<div id="LUprimary" class="luLevelSwitch" style="background-color: blue;">Primary</div>
										<div id="LUsecondary" class="luLevelSwitch" style="border-left:1px solid #afafaf; padding-left:4px; background-color: yellow;">Secondary</div>
									</div>-->

 									<ul id="landUseList" class="LUlist">
										<li id="forest" class="forest">Forest</li>
										<li id="developed" class="developed">Developed</li>
										<li id="ag" class="ag">Agriculture</li>
										<li id="nonForWet" class="nonForWet">Non-forest Wetland</li>
										<li id="rangeland" class="rangeland">Rangeland</li>
										<li id="otherLU" class="otherLU">Other</li>
									</ul>
									
									<ul id="landUseListSec" class="LUlist" style="display:none">
										<li id="forest" class="forest">Forest</li>
										<li id="developed" class="developed">Developed</li>
										<li id="ag" class="ag">Agriculture</li>
										<li id="nonForWet" class="nonForWet">Non-forest Wetland</li>
										<li id="rangeland" class="rangeland">Rangeland</li>
										<li id="otherLU" class="otherLU">Other</li>
									</ul>
									
									<p class="subHeader">Notes:</p>
									<ul id="LUnotesList" class="notesList">					
										<li><input id="wetland" class="wetland forForest" type="checkbox" name="landUse" value="wetland" autocomplete="off"> Wetland</li>
										<li><input id="mining" class="mining forDeveloped" type="checkbox" name="landUse" value="mining" autocomplete="off"> Mining</li>
										<li><input id="rowCrop" class="rowCrop forAg" class="rowCrop forAg" type="checkbox" name="landUse" value="rowCrop" autocomplete="off"> Row crop</li>
										<li><input id="orchardTreeFarm" class="orchardTreeFarm forAg" type="checkbox" name="landUse" value="orchardTreeFarm" autocomplete="off"> Orchard/Tree farm</li>
										<li><input id="vineyardsOtherWoody" class="vineyardsOtherWoody forAg" type="checkbox" name="landUse" value="vineyardsOtherWoody" autocomplete="off"> Vineyard/Other woody</li>
									</ul>
									
									<ul id="LUnotesListSec" class="notesList" style="display:none">					
										<li><input id="wetland" class="wetland forForest" type="checkbox" name="landUse" value="wetland" autocomplete="off"> Wetland</li>
										<li><input id="mining" class="mining forDeveloped" type="checkbox" name="landUse" value="mining" autocomplete="off"> Mining</li>
										<li><input id="rowCrop" class="rowCrop forAg" class="rowCrop forAg" type="checkbox" name="landUse" value="rowCrop" autocomplete="off"> Row crop</li>
										<li><input id="orchardTreeFarm" class="orchardTreeFarm forAg" type="checkbox" name="landUse" value="orchardTreeFarm" autocomplete="off"> Orchard/Tree farm</li>
										<li><input id="vineyardsOtherWoody" class="vineyardsOtherWoody forAg" type="checkbox" name="landUse" value="vineyardsOtherWoody" autocomplete="off"> Vineyard/Other woody</li>
									</ul>
									
									
									<!-- <div id="landUseDoneBtn" class="doneBtn">Done</div> -->
								</div>
 							</td>
							<td style="padding:0px 0px 0px 0px; border:none;">
								<div id="landCoverDiv" style="margin:4px 4px 0px 3px"> <!-- class="dropThis" -->
									<!-- <div id="landCoverSelection" class="formDropSelection" align="center"><span class="glyphicon glyphicon-triangle-bottom"></span></div> --> <!-- <div id="theSelection"></div> -->
									<p class="subHeader">Land Cover:</p> <!-- style="margin-bottom:24px;"-->
									<ul id="lcLevelSwitchHolder" class="lulcLevelSwitchHolder">
										<li id="LCprimaryTab" class="selected" style="border-top-left-radius:4px; border-top-right-radius:4px; text-align:center;">Primary
									</ul>

 									<ul id="landCoverList">
										<li id="treesLC">Trees</li>
										<li id="shrubsLC">Shrubs</li>
										<li id="gfhLC">Grass/forb/herb</li>
										<li id="imperviousLC">Impervious</li>
										<li id="natBarLC">Natural barren</li>
										<li id="snowIceLC">Snow/ice</li>
										<li id="waterLC">Water</li>
									</ul>
									<p class="subHeader">Other:</p>
									<ul id="LCnotesList" class="notesList">
										<li class="trees"><input id="trees" type="checkbox" name="landCover" value="trees" autocomplete="off"> Trees</li>
										<li class="shrubs"><input id="shrubs" type="checkbox" name="landCover" value="shrubs" autocomplete="off"> Shrubs</li>
										<li class="grassForbHerb"><input id="grassForbHerb" type="checkbox" name="landCover" value="grassForbHerb" autocomplete="off"> Grass/forb/herb</li>
										<li class="impervious"><input id="impervious" type="checkbox" name="landCover" value="impervious" autocomplete="off"> Impervious</li>
										<li class="naturalBarren"><input id="naturalBarren" type="checkbox" name="landCover" value="naturalBarren" autocomplete="off"> Natural/barren</li>
										<li class="snowIce"><input id="snowIce" type="checkbox" name="landCover" value="snowIce" autocomplete="off"> Snow/ice</li>
										<li class="water"><input id="water" type="checkbox" name="landCover" value="water" autocomplete="off"> Water</li>
									</ul>
									<!-- <div id="landCoverDoneBtn" class="doneBtn">Done</div> -->
								</div>
 							</td>
						<tr>
					</table>
					<!-- <div id="luLcDoneBtn" class="doneBtn">Done</div> -->
				</div>
				
				<div id="CommentsFormDiv">						
					<div id="commentInputDiv">
						<textarea id="commentInput" autocomplete="off"></textarea>
					</div>
				</div>
				
				
			</div>
			
		<!--<div id="timeLapse" class="sectionDiv">
				<p class="header">Time-Lapse</p>

				<div id="tlHolder" style="margin:0px 5px 0px 5px">
					<canvas id="tlCanvas" width=235 height=235></canvas>
					<div id="tlDate" style="text-align:center">&nbsp</div>
				</div>
 				<div class="text-center">
					<div class="btn-group btn-group-xs" role="group" aria-label="...">
					  <button id="tlPlay" type="button" class="btn btn-default tlBtn"><span class="glyphicon glyphicon-play"></span></button>			
					  <button id="tlBack" type="button" class="btn btn-default tlBtn"><span class="glyphicon glyphicon-step-backward"></span></button>
					  <button id="tlForward" type="button" class="btn btn-default tlBtn"><span class="glyphicon glyphicon-step-forward"></span></button>
					  <button id="tlBackx2" type="button" class="btn btn-default tlBtn"><span class="glyphicon glyphicon-fast-backward"></span></button>
					  <button id="tlForwardx2" type="button" class="btn btn-default tlBtn"><span class="glyphicon glyphicon-fast-forward"></span></button>
					  <button id="flicker" type="button" class="btn btn-default tlBtn"><span class="glyphicon glyphicon-adjust"></span></button>
					  <button id="slower" type="button" class="btn btn-default tlBtn"><span class="glyphicon glyphicon-minus-sign"></span></button>
					  <button id="faster" type="button" class="btn btn-default tlBtn"><span class="glyphicon glyphicon-plus-sign"></span></button>
					</div>
				</div>
			</div>-->
			
			
<!-- 			<div id="commentsSection" class="sectionDiv">
				<p class="header">Comments</p>
				<div id="commentInputDiv">
					<textarea id="commentInput" autocomplete="off"></textarea>
				</div>
			</div> -->

		</div>
		
		<div id="chipGallerySection">
			<p class="header">Image Chip Selection</p> <!--<span id="expandChipGallery" class="glyphicon glyphicon-new-window right-align" style="float:right; margin:3px; cursor:pointer"></span>-->
			<div id="chip-gallery"></div>
		</div>
		<div id="img-gallery"></div>	
		
		<div id="contextMenu" style="display:none; position:absolute">
			<p class="subHeader">Copy options:</p>
			<ul id="contextMenuList">
				<li id="copyPrev">Copy from previous</li>
				<li id="fillDown">Copy to all following</li>
				<li id="fillCancel">Cancel</li>
			</ul>
		</div>

		<!-- Modal -->
<!-- 		<div id="doyCalModal" class="modal fade" role="dialog">
		  <div class="modal-dialog modal-lg">

			
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Day-of-year Calendar</h4>
			  </div>
			  <div id="doyCalBody" class="modal-body" style="overflow-y:scroll">

			  </div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			  </div>
			</div>

		  </div>
		</div>	 -->
		
		
		
		
		
		
<!-- 		<div id="tsGuideModal" class="modal fade" role="dialog">
		  <div class="modal-dialog modal-lg">

			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">TimeSync Guide</h4>
			  </div>
			  <div id="tsGuideBody" class="modal-body" style="overflow-y:scroll">

			  </div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			  </div>
			</div>

		  </div>
		</div> -->	
		
		
		
		<script>				
			
			//appendChips("main",[0,n_chips-1]); //n_chips might not be loaded at this point - keep in mind
			//window.onload = start;
			
			//var tlCanvasID = document.getElementById("tlCanvas"); //this is for the time lapse video - not used
			//var tlctx = tlCanvasID.getContext("2d"); //global - this is for the time lapse video - not used
			
			//$("#tsGuideBody").load("ts_guide.html"); //append the html guide file			
			//$("#doyCalBody").load("doy_calendar.html"); //append the html guide file
		
		</script>
		<script type="text/javascript" src="tsv3_scripts.js"></script>
		<script type="text/javascript" src="tsv3_tooltips.js"></script>		
	</body>
</html>