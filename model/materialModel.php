<?php

require_once PROJECT_ROOT_PATH . "/Model/database.php";

class MaterialModel extends Database
{
    /**
     * @throws Exception
     */
    public function getMaterials(array $params)
    {
        $queryString = "CALL _materialSelect(
            '" . ($params["name"] ?? '') . "',
            '" . ($params["code"] ?? '') . "', 
            " . ($params["limit"] ?? 10) . ");";
        return $this->select($queryString);
    }

    /**
     * @throws Exception
     */
    public function updMaterials(array $params)
    {
        $queryString = "CALL _materialUpdate(
            '" . $params["product_guid"] . "', 
            '" . $params["code"]. "', 
            " . $params["w"] . ", 
            " . $params["l"] . ", 
            " . $params["t"] . ", 
            " . $params["type"] . ");";
        $this->update($queryString);
    }

    /**
     * @throws Exception
     */
    public function updMaterialsi18(array $params)
    {
        foreach ($params["props"] as $propLang => $lng) {
            $queryString = "CALL _material_i18_Update(
                '" . $params["product_guid"] . "', 
                '" . $lng["name"] . "', 
                '" . $lng["desc"] . "', 
                '" . $propLang . "');";
            $this->update($queryString);
        }
    }

    /**
     * @throws Exception
     */
    public function updMaterialsParams(array $params)
    {
        foreach ($params["params"] as $propPar => $prm) {
            $resId = 0;
            foreach ($prm as $lng => $l){
//                $propPar -- guid параметра
//                $lng -- язык
//                $l["name"] -- наименование параметра
//                $l["value"] -- значение параметра
                $queryString = "CALL _materialParamUpdate(
                '" . $params["product_guid"] . "', 
                '" . $propPar . "', 
                '" . $l["name"] . "', 
                '" . $l["value"] . "', 
                '" . $lng . "', 
                " . $resId . ", @pid);";
                $res = $this->select($queryString);
                $resId = $res[0]["out_vid"];
            }
        }
    }
}