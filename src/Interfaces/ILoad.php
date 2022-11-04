<?php
interface ILoad
{
    /**
     * @param string|null $eGuid
     * @param int $Limit
     * @return string
     * @throws InvalidArgumentException
     */
    public function updEntity(json $json): string;

}