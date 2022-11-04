<?php

require_once PROJECT_ROOT_PATH . "/Model/database.php";

class BandModel extends Database
{

    /**
     * @throws Exception
     */
    public function getBands(array $params)
    {
        $queryString = "CALL _bandSelect(
            '" . ($params["name"] ?? '') . "',
            '" . ($params["code"] ?? '') . "', 
            " . ($params["limit"] ?? 10) . ");";
        return $this->select($queryString);
    }

    /**
     * @throws Exception
     */
    public function updBands(array $params)
    {
        $queryString = "CALL _bandUpdate(
            '" . $params["product_guid"] . "', 
            '" . $params["code"] . "', 
            " . $params["w"] . ", 
            " . $params["t"] . ", 
            " . $params["type"] . ");";
        $this->update($queryString);
    }

    /**
     * @throws Exception
     */
    public function updBandsi18(array $params)
    {
        foreach ($params["props"] as $propLang => $lng) {
            $queryString = "CALL _band_i18_Update(
                '" . $params["product_guid"] . "', 
                '" . $lng["name"] . "', 
                '" . $lng["desc"] . "', 
                '" . $propLang . "');";
            $this->update($queryString);
        }
    }

    public function updBandsParams(array $params)
    {
        $oPrmGuid = '';
        foreach ($params["params"] as $propPar => $prm) {
            $resId = 0;
//            $propPar -- guid параметра
            foreach ($prm as $lng => $l){
//                $lng -- язык
//                $l["name"] -- наименование параметра
//                $l["value"] -- значение параметра
                $queryString = "CALL _bandParamUpdate(
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