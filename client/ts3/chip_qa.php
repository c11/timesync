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
      	echo "error";
      	exit;
      }
    }
    else {
    	echo "error";
    	exit;
    }
  }
  else {
  	echo "error";
  	exit;
  }
?>
<!DOCTYPE html>
<html lan="en">
	<head>
		<title>Intra-Annual Chip Gallery</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="timesync_style.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<script src="jquery.mousewheel.min.js"></script>
		<!--script src="imagesLoaded.js"></script>-->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.imagesloaded/3.2.0/imagesloaded.pkgd.min.js"></script>	
		<script>
		var userID = '<?php echo $token->data->userId; ?>';
		</script>
		<style>

		</style>
	</head>
	<body style="min-width:100%;">

		<div id="chipGallerySection" style="margin:5px;">
			<p id="pageTitle" class="header"></p>
			<div id="chip-gallery" style="width:auto; height:auto; overflow-y:scroll"></div>
		</div>
		<div id="img-gallery"></div>
		<input id="selectedColor" autocomplete="off" type="color" name="selectedColor" value="#ED2939" style="display:none;">

		<script>
		
			///////////////////SEND MESSAGES TO THE ORIGIN WINDOW///////////////////	
			$("body").on("click",".chipImg.intraAnnual",function(){
					var canvasIDindex = $("canvas").index(this)
					$(".chipHolder").removeClass("selected");
					$(".chipHolder").eq(canvasIDindex).addClass("selected");				
					var newSyOffset = 0*255, //canvasIDindex    //calc the source x offset for that chip
						
						passback = {
							"action":"replace_chip",
							"newSyOffset":newSyOffset, //tell the origin where to set the original offset for the chip
							"originChipIndex":originChipIndex, //tell the origin which chip to set the original offset for (index)
							"useThisChip":0, //canvasIDindex,//tell the origin what chip to use instead
							"src":origData[canvasIDindex].url, //images[canvasIDindex],
							"data":data.Values[canvasIDindex],
							"julday":juldays[canvasIDindex]
						};

					originURL.postMessage(JSON.stringify(passback), '*'); //the 'originURL' object is just the url of the origin window saved when a messages was received from it	
			});
			
			$(document).on({
				mouseenter:function(){				
					var canvasIDindex = $("canvas").index(this);
					var message = {
						"action":"mouseEnter",
						"data":data.Values[canvasIDindex]
					}					
					originURL.postMessage(JSON.stringify(message), '*');				
				},
				mouseleave:function(){
					var canvasIDindex = $("canvas").index(this)
					var message = {
						"action":"mouseLeave",
						"data":data.Values[canvasIDindex]
					}					
					originURL.postMessage(JSON.stringify(message), '*');		
				}
			},".chipImg.intraAnnual");
			
			
			
			/////////////////////////////////////////////////////////////////////////

			
			
			


			//////////////////////////GET MESSAGES FROM ORIGIN///////////////////////////////// 
			//global variables from js file
			//origData
			//n_chips
			//data
			//chipDisplayProps
			
			//global to this html page
			var originURL = ""; //need to save the url of the origin window - will get it once a message has been sent from it
			var originChipIndex = 0;
			var juldays = [];
			var year = 0
			var julday = 0
			var chipDisplayProps = {};
			//var images = []; //not used when src is not a chip strip
			
			//receive messages from the origin window
			$(window).on("message onmessage",function(e){
				//console.log("got the message")
				var dataFromOrigin = JSON.parse(e.originalEvent.data);
				
				chipDisplayProps = dataFromOrigin.chipDisplayProps; //reset global
				if(dataFromOrigin.action == "add_chips"){
					originURL = e.originalEvent.source; //the 'e.originalEvent.source' is just the url of the origin window - save it for use later when we need to send messages to the origin window
					
					//unpack the message 
					year = dataFromOrigin.year;  //needed for chipInfo object
					julday = dataFromOrigin.julday;  //needed for chipInfo object
					originChipIndex = dataFromOrigin.chipIndex; //reset global
					
					
					//project = dataFromOrigin.projectID; //reset global
					//plot = dataFromOrigin.plot;	//reset global				
					//images = dataFromOrigin.src; //need global //not used when src is not a chip strip
					//useThisChip = dataFromOrigin.useThisChip; //not used when src is not a chip strip
					$("#pageTitle").text("All Image Chips for "+year); //set the page title with the year
					$("#selectedColor").prop(dataFromOrigin.selectedColor);
					
					//when the document is ready do stuff
					$(document).ready(function(){
						//console.log("doing stuff")
						$("#chip-gallery").empty(); //reset
						$("#img-gallery").empty(); //reset
						juldays = []; //reset
						chipInfo = {useThisChip:[],canvasIDs:[],imgIDs:[],sxOrig:[],syOrig:[],sWidthOrig:[],sxZoom:[],syZoom:[],sWidthZoom:[],chipsInStrip:[],year:[],julday:[],src:[]}; //reset global
			
						var url = 'http://timesync.forestry.oregonstate.edu/_ts3/data/'+dataFromOrigin.userID+'/'+dataFromOrigin.projectID+'/'+dataFromOrigin.tsa+'/'+dataFromOrigin.plotID+'/'+dataFromOrigin.year						
						$.getJSON(url).done(function(returnedData){
							origData = returnedData; //reset global
							n_chips = origData.length; //reset global
							data = {"Values":[]}; //reset global
							for(var i=0;i<n_chips;i++){
								data.Values.push(parseSpectralData(origData,i));
								juldays.push(origData[i].image_julday); //reset global
							}
							data = calcIndices(data); //reset global - calculate the spectral indices
							data = calcDecDate(data)
							
							appendSrcImg();
							var thisIndex = [$.inArray(dataFromOrigin.julday,juldays)] //figure out what date was shown in the main window so it can be highlighted							
							appendChips("intraAnnual",thisIndex);							
							
							//$(window).on("load",function(){
							//	makeChipInfo("json", origData);
							//	drawAllChips("intraAnnual");							
							//})
							
							$("#img-gallery").imagesLoaded(function(){						 
								makeChipInfo("json", origData);
								drawAllChips("intraAnnual");		
							}).done( function( instance ) {
								//console.log('all images successfully loaded');
							});						
						});
					});
				} else if (dataFromOrigin.action == "zoom"){
					drawAllChips("intraAnnual");
				} else if (dataFromOrigin.action == "chipSize"){
					var selectThis = [$(".chipHolder.selected").index()]
					$(".chipHolder").remove();
					appendChips("intraAnnual", selectThis);
					drawAllChips("intraAnnual");						
				} else if(dataFromOrigin.action == "plotSize"){
					updateChipInfo();
					drawAllChips("intraAnnual");	
				} else if(dataFromOrigin.action == "clearChips"){
					$("#pageTitle").text("");
					$("#chip-gallery").empty(); //reset
					$("#img-gallery").empty(); //reset
				}
				
				
				//$("#message").append(e.originalEvent.data); //****need to use 'originalEvent' instead of 'event' since im using jquery to bind the event. the jquery event object is different from the javascript event object - originalEvent is a copied version of the original javascript event object
			});	
			//////////////////////////////////////////////////////////////////////////////////
			

		</script>
		<script type="text/javascript" src="specIndexStretch.min.js"></script>
		<script type="text/javascript" src="tsv3_scripts.js"></script>
	</body>
</html>