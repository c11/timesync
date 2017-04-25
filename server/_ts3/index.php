<?php
/**
 * User: yang
 * Date: 11/18/15
 * Time: 9:34 AM
 */
require 'vendor/autoload.php';
require_once 'services/PlotsService.php';
require_once 'services/RegionSpectralService.php';
require_once 'services/VertexService.php';
require_once 'services/ProjectService.php';
require_once 'services/CommentService.php';
require_once 'services/ResponseDesignSevice.php';
require_once 'services/UserService.php';
require_once 'config.php';

use \Firebase\JWT\JWT;

$app = new \Slim\Slim(array('templates.path'=>'.'));
// $app->add(new TsAuthentication());
$app->config('debug', false);

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

// Define app routes
$app->get('/version', function() {
    echo "TimeSync V3.0";
});

function createToken($uid, $user) {
    $tokenId    = base64_encode(uniqid());
    $issuedAt = time();
    $notBefore  = $issuedAt + 10;
    $expire     = $notBefore + 60;
    $serverName = TimeSyncSettings::APP_NAME;

    /*
     * Create the token as an array
     */
    $data = array(
        'iat'  => $issuedAt,         // Issued at: time when the token was generated
        'jti'  => $tokenId,          // Json Token Id: an unique identifier for the token
        'iss'  => $serverName,       // Issuer
        //'nbf'  => $notBefore,        // Not before
        //'exp'  => $expire,           // Expire
        'data' => array(                  // Data related to the signer user
            'userId'   => $uid,    // userid from the users table
            'userName' => $user)   // User name
    );

    $secretKey = base64_encode(TimeSyncSettings::JWT_KEY);

    return array('jwt' => JWT::encode($data, $secretKey));
}

$app->get('/login', function() use ($app) {
    $app->render('login.php');
});

$app->post('/token', function() use ($app) {
    $auth = json_decode($app->request->post('auth'));
    $service = new UserService();

    $uid = $auth->userid;
    $pas = $auth->credential;

    $result = $service->getUserByCredential($uid, $pas);

    $token = '{"error": 1, "message": "unauthorized access"}';
    if (!is_null($result)) {
        $token = createToken($result->user_id, $result->user_name);
    }

    echo json_encode($token);
    exit;
});

$authentication = function($app) {
    return function() use ($app) {
        // $authHeader = $app->request->headers->get('Authorization');
        return;

        $headers = apache_request_headers();
        $authHeader = $headers['Authorization'];

        $result = '{"error": 2, "message": "HTTP/1.0 401 Unauthorized"}';
        if ($authHeader) {
            list($jwt) = sscanf($authHeader, 'Bearer %s');

            if ($jwt) {
                try {
                    $secretKey = base64_encode(TimeSyncSettings::JWT_KEY);
                    $token = JWT::decode($jwt, $secretKey, array('HS256'));
                }
                catch (Exception $e) {
                    // header('HTTP/1.0 401 Unauthorized');
                    // $app->flash('Error', 'Login required');
                    // $app->redirect('/_y/login');
                    echo json_encode($result);
                    exit;
                }
            }
            else {
                // header('HTTP/1.0 401 Unauthorized');
                // $app->flash('Error', 'Login required');
                // $app->redirect('/_y/login');
                echo json_encode($result);
                exit;
            }
        }
        else {
            echo json_encode('{"error": 3, "message": "HTTP/1.0 400 Bad Request"}');
            exit;
            // header('HTTP/1.0 400 Bad Request');
            // $app->flash('Error', 'Login required');
            // $app->redirect('/_y/login');
        }
    };
};

$app->get('/project/:interpreter', $authentication($app), function($interpreter) {
    $service = new ProjectService();
    $tasks = $service->getUserTasks($interpreter, 1);
    header('Content-Type: application/json');
    echo json_encode($tasks);
    exit;
});

$app->get('/plot/:interpreter/:project_id/:tsa/:packet', $authentication($app), function($interpreter, $project_id, $tsa, $packet) {
    $service = new PlotsService();

    $plots = $service->getAllPlots($project_id, $tsa, $interpreter, $packet);

    header('Content-Type: application/json');
    echo json_encode($plots);
    exit;
});

$app->get('/data/:interpreter/:project_id/:tsa/:plotid', $authentication($app), function($interpreter, $project_id, $tsa, $plotid) {
    $service = new RegionSpectralService();

    $spectrals = $service->getRegionSpectralByPlot($project_id, $tsa, $plotid, $interpreter);

    echo json_encode($spectrals);
    exit;
});

$app->get('/data/:interpreter/:project_id/:tsa/:plotid/:year', $authentication($app), function($interpreter, $project_id, $tsa, $plotid, $year) {
    $service = new RegionSpectralService();

    $spectrals = $service->getAllRegionSpectralByPlotForYear($project_id, $tsa, $plotid, $year);

    header('Content-Type: application/json');
    echo json_encode($spectrals);
    exit;
});


$app->get('/vertex/:interpreter/:project_id/:tsa/:plotid', $authentication($app), function($interpreter, $project_id, $tsa, $plotid) {
    $service = new VertexService();

    $vertices = $service->getVerticesForPlot($project_id, $tsa, $plotid, $interpreter);

    header('Content-Type: application/json');
    echo json_encode($vertices);
    exit;
});


$app->post('/vertex/save', $authentication($app), function() use ($app) {
    $postvars = $app->request->post('vertInfoSave');
    $service = new VertexService();
    
    $data = json_decode($postvars);

    $result = '{"error": 1, "message": "no data provided"}';
    if ($postvars && $data->userID > 0) {
        $result = $service->saveVertices($postvars);
        $result = '{"error": 0, "message": "success"}';
    }

    echo json_encode($result);
    exit;
});


/**
 * Save interpreter's comment for a given plot
 *
 * data passed in
 * {comment: {
 *      projectID: 1,
 *      tsa: 999999,
 *      plotID: 1,
 *      userID: 1,
 *      comment: 'some text'
 *  }
 * }
 */
$app->post('/comment/save', $authentication($app), function() use ($app) {
    $comment = json_decode($app->request->post('comment'));
    $service = new CommentService();

    $result = '{"error": 1, "message": "no data provided"}';

    #only save when user is not viewer
    if (!is_null($comment) && $comment->userID > 0) {
        $result = $service->createComments($comment->projectID, $comment->tsa, $comment->plotID, $comment->userID, $comment->comment, $comment->isComplete, $comment->isExample);
        $result = '{"error": 0, "message": "success"}';
    }

    echo json_encode($result);
    exit;
});

$app->get('/comment/:interpreter/:project_id/:tsa/:plotid', $authentication($app), function($interpreter, $project_id, $tsa, $plotid) {
    $service = new CommentService();

    $spectrals = $service->getComment($project_id, $tsa, $plotid, $interpreter);

    echo json_encode($spectrals);
    exit;
});

/**
 * Override image chip
 *
 * data passed in
 * { projectID: 1,
 *   tsa: 999999,
 *   plotID: 1,
 *   userID: 9,
 *   year: 1989,
 *   julday: 225,
 *   oldJulday: 210
 * }
 */
$app->post('/image/override', $authentication($app), function() use ($app) {
    $chipPreference = json_decode($app->request->post('imagePreference'));
    $service = new RegionSpectralService();

    $result = '{"error": 1, "message": "no data provided"}';

    if ($chipPreference && $chipPreference->userID > 0) {
        $result = $service->overrideImagePreference($chipPreference->userID,
            $chipPreference->projectID,
            $chipPreference->tsa,
            $chipPreference->plotID,
            $chipPreference->year,
            $chipPreference->julday,
            $chipPreference->oldJulday);
        $result = '{"error": 0, "message": "success"}';
    }

    echo json_encode($result);
    exit;
});

/**
 * response design
 */
$app->get('/configuration/responses/:project_id', function($project_id) {
    $service = new ResponseDesignService();
    $design = $service->getResponseDesign($project_id);
    echo json_encode($design);
    exit;
});

$app->run();
