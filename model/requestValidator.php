<?php

class requestValidator
{
    private static array $requestRule;
    private array $params;

    public function __construct(array $rule, array $param)
    {
        self::$requestRule = $rule;
        $this->params = $param;
    }

    public function validateUpdateRequest(): array
    {
        foreach (self::$requestRule as $field => $rules) {
            if (in_array('required', $rules, true)) {
                if (!in_array($field, array_keys($this->params), true)) {
                    return ['error' => 'required', 'field' => $field, 'success' => false];
                }
            }
        }
        return ['success' => true];
    }
}
