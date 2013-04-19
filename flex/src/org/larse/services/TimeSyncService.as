/**
 * This is a generated sub-class of _TimeSyncService.as and is intended for behavior
 * customization.  This class is only generated when there is no file already present
 * at its target location.  Thus custom behavior that you add here will survive regeneration
 * of the super-class. 
 **/
 
package org.larse.services
{
	import mx.rpc.AsyncToken;

public class TimeSyncService extends _Super_TimeSyncService
{
    /**
     * Override super.init() to provide any initialization customization if needed.
     */
    protected override function preInitializeService():void
    {

        super.preInitializeService();
        // Initialization customization goes here
    }
	
	public function TimeSyncService(gateway:String="", server:String="") {
		super();
		this.endpoint = gateway;
		this.server = server;
	}
	
	public var server:String = "";

//---------------------------------------------------------------------------
//  Plot Service
//---------------------------------------------------------------------------

	public function getAllPlots(project_id:int, tsa:int, interpreter:int):AsyncToken {
		return plotService.getAllPlots(project_id, tsa, interpreter);
	}
	
//---------------------------------------------------------------------------
//  ImageList Service
//---------------------------------------------------------------------------
	public function getImageList(project_id:int, tsa:int):AsyncToken {
		return imageListService.getImageList(project_id, tsa);
	}

//---------------------------------------------------------------------------
//  SpectralProperty Service
//---------------------------------------------------------------------------
	public function getSpectralProperties():AsyncToken {
		return spectralPropertyService.getSpectralProperties();
	}

//---------------------------------------------------------------------------
//  RegionSpectral Service
//---------------------------------------------------------------------------
	public function getPlotRegionSpectral(project_id:int, tsa:int, plotid:int):AsyncToken {
		return regionSpectralService.getRegionSpectralByPlot(project_id, tsa, plotid);
	}	

	public function getPlotAllRegionSpectral(project_id:int, tsa:int, plotid:int):AsyncToken {
		return regionSpectralService.getAllRegionSpectralByPlot(project_id, tsa, plotid);
	}
	
	public function overrideImagePriority(project_id:int, tsa:int, plotid:int, year:int, day:int, oldYear:int, oldDay:int):AsyncToken {
		return regionSpectralService.overrideImagePriority(project_id, tsa, plotid, year, day, oldYear, oldDay);
	}
	
	public function getPlotRegionSpectralForYear(project_id:int, tsa:int, plotid:int, year:int):AsyncToken {
		return regionSpectralService.getAllRegionSpectralByPlotForYear(project_id, tsa, plotid, year);
	}
	
//---------------------------------------------------------------------------
//  Project Service
//---------------------------------------------------------------------------
	public function getAssignments(user_id:int, role:int):AsyncToken {
		return projectService.getUserTasks(user_id, role);
	}	
	
//---------------------------------------------------------------------------
//  User Service
//---------------------------------------------------------------------------
	public function login(user_name:String, pass:String):AsyncToken {
		return userService.getUserByCredential(user_name, pass);
	}

//---------------------------------------------------------------------------
//  Vertex Service
//---------------------------------------------------------------------------
	public function saveVertex(project_id:int, tsa:int, plotid:int, interpreter:int, sql:String):AsyncToken {
		return vertexService.createVertices(project_id, tsa, plotid, interpreter, sql);
	}
	
	public function loadVerticesForPlot(project_id:int, tsa:int, plotid:int, interpreter:int):AsyncToken {
		return vertexService.getVerticesForPlot(project_id, tsa, plotid, interpreter);
	}
	
//---------------------------------------------------------------------------
//  Vertex Service
//---------------------------------------------------------------------------
	public function saveNeighbor(project_id:int, tsa:int, plotid:int, interpreter:int, sql:String):AsyncToken {
		return neighborService.createNeighbors(project_id, tsa, plotid, interpreter, sql);
	}
	
	public function loadNeighborsForPlot(project_id:int, tsa:int, plotid:int, interpreter:int):AsyncToken {
		return neighborService.getNeighborForPlot(project_id, tsa, plotid, interpreter);
	}
	
//---------------------------------------------------------------------------
//  Comment Service
//---------------------------------------------------------------------------
	public function loadCommentForPlot(project_id:int, tsa:int, plotid:int, interpreter:int):AsyncToken {
		return commentService.getComment(project_id, tsa, plotid, interpreter);
	}
	
	public function saveComment(project_id:int, tsa:int, plotid:int, interpreter:int, comment:String, is_example:int, is_complete:int, is_wetland:int, uncertainty:int):AsyncToken {
		return commentService.createComments(project_id, tsa, plotid, interpreter, comment, is_example, is_complete, is_wetland, uncertainty);
	}
//---------------------------------------------------------------------------
//  Server Objects
//---------------------------------------------------------------------------
	private var _imageListService:ImageListService = null;
	protected function get imageListService():ImageListService {
		if (_imageListService==null) {
			_imageListService = new ImageListService();
			_imageListService.endpoint = this.endpoint;
			_imageListService.server = this.server;
		}
		return _imageListService;
	}

	private var _neighborService:NeighborService = null; 
	protected function get neighborService():NeighborService {
		if (_neighborService==null) {
			_neighborService = new NeighborService();
			_neighborService.endpoint = this.endpoint;
			_neighborService.server = this.server;
		}
		return _neighborService;
	}
	
	private var _plotService:PlotsService = null; 
	protected function get plotService():PlotsService {
		if (_plotService==null) {
			_plotService = new PlotsService();
			_plotService.endpoint = this.endpoint;
			_plotService.server = this.server;
		}
		return _plotService;
	}
	
	private var _regionSpectralService:RegionSpectralService = null; 
	protected function get regionSpectralService():RegionSpectralService {
		if (_regionSpectralService==null) {
			_regionSpectralService = new RegionSpectralService();
			_regionSpectralService.endpoint = this.endpoint;
			_regionSpectralService.server = this.server;
		}
		return _regionSpectralService;
	}
	
	private var _spectralPropertyService:SpectralPropertyService = null; 
	protected function get spectralPropertyService():SpectralPropertyService {
		if (_spectralPropertyService==null) {
			_spectralPropertyService = new SpectralPropertyService();
			_spectralPropertyService.endpoint = this.endpoint;
			_spectralPropertyService.server = this.server;
		}
		return _spectralPropertyService;
	}
	
	private var _vertexService:VertexService = null; 
	protected function get vertexService():VertexService {
		if (_vertexService==null) {
			_vertexService = new VertexService();
			_vertexService.endpoint = this.endpoint;
			_vertexService.server = this.server;
		}
		return _vertexService;
	}
	
	private var _projectService:ProjectService = null;
	protected function get projectService():ProjectService {
		if (_projectService==null) {
			_projectService = new ProjectService();
			_projectService.endpoint = this.endpoint;
			_projectService.server = this.server;
		}
		return _projectService;
	}
	
	private var _userService:UserService = null;
	protected function get userService():UserService {
		if (_userService==null) {
			_userService = new UserService();
			_userService.endpoint = this.endpoint;
			_userService.server = this.server;
		}
		return _userService;
	}
	
	private var _commentService:CommentService = null;
	protected function get commentService():CommentService {
		if (_commentService==null) {
			_commentService = new CommentService();
			_commentService.endpoint = this.endpoint;
			_commentService.server = this.server;
		}
		return _commentService;
	}
	
}

}
