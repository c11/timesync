<?php

require_once 'vendor/autoload.php';
require_once 'config.php';

use \Firebase\JWT\JWT;

class TsAuthentication {
	public function call() {
    //The Slim application
    $app = $this->app;

    //The Request object
    $req = $app->request;
    $authHeader = $req->headers->get('authorization');

    if ($authHeader) {
    	list($jwt) = sscanf($authHeader->toString(), 'Authorization: Bearer %s');

    	if ($jwt) {
    		try {
    			$secretKey = base64_encode(TimeSyncSettings::JWT_KEY);
    			$token = JWT::decode($jwt, $secretKey, array('HS256'));
    			$this->next->call();
    		}
    		catch (Exception $e) {
    			header('HTTP/1.0 401 Unauthorized');
    		}
    	}
    	else {
    		header('HTTP/1.0 401 Unauthorized');
    	}
    }
    else {
    	header('HTTP/1.0 400 Bad Request');
    	echo 'Token not found in request';
    }
	}

}