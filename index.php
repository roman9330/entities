<?php

require __DIR__ . "/inc/bootstrap.php";
require __DIR__ . "/vendor/autoload.php";

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$uri = explode('/', $uri);

if ((!isset($uri[1])) || !isset($uri[2])) {
    header("HTTP/1.1 404 Not Found");
    exit();
}

switch ($uri[1]) {
    case 'band':
        require PROJECT_ROOT_PATH . "controller/api/bandController.php";
        $objectFeedController = new BandController();
        $strMethodName = $uri[2] . 'Action';
        $objectFeedController->{$strMethodName}();
        break;
    case 'material':
        require PROJECT_ROOT_PATH . "controller/api/materialController.php";
        $objectFeedController = new MaterialController();
        $strMethodName = $uri[2] . 'Action';
        $objectFeedController->{$strMethodName}();
        break;
    case 'service':
        require PROJECT_ROOT_PATH . "controller/api/serviceController.php";
        $objectFeedController = new ServiceController();
        $strMethodName = $uri[2] . 'Action';
        $objectFeedController->{$strMethodName}();
        break;
    default:
        header("HTTP/1.1 404 Not Found");
        exit();
}

?>