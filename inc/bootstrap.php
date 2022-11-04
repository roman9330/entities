<?php

define("PROJECT_ROOT_PATH", __DIR__ . "/../");

// include main configuration file
require_once PROJECT_ROOT_PATH . "/inc/config.php";

// include the base controller file
require_once PROJECT_ROOT_PATH . "/controller/api/baseController.php";

// include the use model file
$modelFiles = scandir(PROJECT_ROOT_PATH ."/model/");
foreach ($modelFiles as $mFile){
    if (validateFileModel($mFile)){
        require_once PROJECT_ROOT_PATH . "/model/" . $mFile;
    }
}

function validateFileModel($fName){
    return strpos($fName,'Model.php');
}

//require_once PROJECT_ROOT_PATH . "/model/bandModel.php";
//require_once PROJECT_ROOT_PATH . "/model/materialModel.php";

?>

