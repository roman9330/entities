<?php
interface IRead
{
    /**
     * @param string|null $eGuid
     * @param int $Limit
     * @return string
     * @throws InvalidArgumentException
     */
    public function getEntity(string $eGuid = Null, int $Limit): string;

}