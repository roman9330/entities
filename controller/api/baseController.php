<?php

class BaseController
{
    protected array $params;

    public function __construct()
    {
        $this->params = self::getParams();
    }

    public function getParams(): array
    {
        $requestMethod = $_SERVER["REQUEST_METHOD"];
        if (strtoupper($requestMethod) == 'GET') {
            $arrQueryStringParams = $this->getQueryStringParams();
        } else {
            $json = file_get_contents('php://input');;
            $arrQueryStringParams = json_decode($json, 1);
        }
        return $arrQueryStringParams ?? [];
    }

    public function __call($name, $arguments)
    {
        $this->sendOutput('', array('HTTP/1.1 404 Not Found'));
    }

    protected function getUriSegments()
    {
        $uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
        $uri = explode('/', $uri);
        return $uri;
    }

    protected function getQueryStringParams()
    {
        parse_str($_SERVER['QUERY_STRING'], $query);
        return $query;
    }

    protected function sendOutput($data, $httpHeaders = array())
    {
        header_remove('Set-Cookie');
        $data = UnsafeOpensslAES::encrypt($data, AUTH_TOKEN);
        if (is_array($httpHeaders) && count($httpHeaders)) {
            foreach ($httpHeaders as $httpHeader) {
                header($httpHeader);
            }
        }
        echo UnsafeOpensslAES::decrypt($data, headerAuth::getBearerToken() ?? 'fhjk');

        exit;
    }
}