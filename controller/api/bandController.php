<?php

require_once PROJECT_ROOT_PATH . "model/requestValidator.php";

class BandController extends BaseController
{
    private array $UPDATE_REQUEST_RULE = [
        'product_guid' => ['required'],
        'code' => ['required'],
        'w' => ['required'],
        't' => ['required'],
        'type' => ['required']
    ];
    private array $UPDATEi18_REQUEST_RULE = [
        'product_guid' => ['required']
    ];

    public function updateAction()
    {
        $strErrorDesc = '';
        try {
            $bandModel = new BandModel();
            $validator = new requestValidator($this->UPDATE_REQUEST_RULE, $this->params);
            $valid = $validator->validateUpdateRequest();
            if ($valid['success'] === true) {
                $bandModel->updBands($this->params);
                $bandModel->updBandsi18($this->params);
                $bandModel->updBandsParams($this->params);
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
            $bandModel = new BandModel();
            $arrBands = $bandModel->getBands($this->params);
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
