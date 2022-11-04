<?php

require_once PROJECT_ROOT_PATH . "model/requestValidator.php";

class MaterialController extends BaseController
{
    private $UPDATE_REQUEST_RULE = [
        'product_guid' => ['required'],
        'code' => ['required'],
        'w' => ['required'],
        'l' => ['required'],
        't' => ['required'],
        'type' => ['required']
    ];
    private $UPDATEi18_REQUEST_RULE = [
        'product_guid' => ['required']
    ];

    public function updateAction()
    {
        $strErrorDesc = '';
        try {
            $bandModel = new MaterialModel();
            $validator = new requestValidator($this->UPDATE_REQUEST_RULE, $this->params);
            $valid = $validator->validateUpdateRequest();
            if ($valid['success'] === true) {
                $bandModel->updMaterials($this->params);
                $bandModel->updMaterialsi18($this->params);
                $bandModel->updMaterialsParams($this->params);
            } else {
                $strErrorDesc = $valid['error'] . '. Field: ' . $valid["field"];
            }
        } catch (Error $e) {
            $strErrorDesc = $e->getMessage() . "Что-то пошло не так!";
            $strErrorHeader = 'HTTP/1.1 422 Unprocessable Entity';
        }

        if (!$strErrorDesc) {
            $this->sendOutput(
                '{"status":"все хорошо"}',
                array('Content-Type: application/json', 'HTTP/1.1 200 OK')
            );
        } else {
            $this->sendOutput(json_encode(array('error' => $strErrorDesc)),
                array('Content-Type: application/json')
            );
        }
    }

    public function getAction()
    {
        $strErrorDesc = '';
        try {
            $bandModel = new MaterialModel();
            $arrBands = $bandModel->getMaterials($this->params);
            $responseData = json_encode($arrBands, JSON_UNESCAPED_UNICODE);
        } catch (Error $e) {
            $strErrorDesc = $e->getMessage() . "Что-то пошло не так!";
            $strErrorHeader = 'HTTP/1.1 422 Unprocessable Entity';
        }

        if (!$strErrorDesc) {
            $this->sendOutput(
                $responseData,
                array('Content-Type: application/json', 'HTTP/1.1 200 OK')
            );
        } else {
            $this->sendOutput(json_encode(array('error' => $strErrorDesc)),
                array('Content-Type: application/json', $strErrorHeader)
            );
        }
    }

}