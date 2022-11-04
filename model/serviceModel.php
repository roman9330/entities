<?php

require_once PROJECT_ROOT_PATH . "/Model/database.php";

class ServiceModel extends Database
{
    /**
     * @throws Exception
     */
    public function getService(array $params)
    {
        $queryString = "CALL _serviceSelect(
            '" . ($params["name"] ?? '') . "',
            '" . ($params["code"] ?? '') . "', 
            " . ($params["limit"] ?? 10) . ");";
        return $this->select($queryString);
    }

    /**
     * @throws Exception
     */
    public function updService(array $params)
    {
        $queryString = "CALL _serviceUpdate(
            '" . $params["product_guid"] . "', 
            '" . $params["code"]. "', 
            " . $params["type"] . ");";
        $this->update($queryString);
    }

    /**
     * @throws Exception
     */
    public function updServicei18(array $params)
    {
        foreach ($params["props"] as $propLang => $lng) {
            $queryString = "CALL _service_i18_Update(
                '" . $params["product_guid"] . "', 
                '" . $lng["name"] . "', 
                '" . $lng["desc"] . "', 
                '" . $propLang . "');";
            $this->update($queryString);
        }
    }

    public function updServiceParams(array $params)
    {
        foreach ($params["params"] as $propPar => $prm) {
            $resId = 0;
            foreach ($prm as $lng => $l){
//                $propPar -- guid параметра
//                $lng -- язык
//                $l["name"] -- наименование параметра
//                $l["value"] -- значение параметра
                $queryString = "CALL _serviceParamUpdate(
                '" . $params["product_guid"] . "', 
                '" . $propPar . "', 
                '" . $l["name"] . "', 
                '" . $l["value"] . "', 
                '" . $lng . "', 
                " . $resId . ", @pid);";
                echo ($queryString . PHP_EOL);
                $res = $this->select($queryString);
                $resId = $res[0]["out_vid"];
            }
        }
    }
}