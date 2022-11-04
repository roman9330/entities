<?php
$json = '	{
	"product_guid": "164B29BD-1EBB-4D23-9DD8-2B3684D7A765",
	"code":"4562",
	"props": {
		"ua": {
			"name": "плита !!!!",
			"desc": "дуже гарна плита"
		},
		"ru": {
			"name": "плита",
			"desc": "Плита зашибись"
		}
	},
		
	"params": {
		"777F0BDF-70A4-4F39-A8C9-2E25B44EAF56":{
			"ua": {
				"name": "новий параметр",
				"value": "діагональ111"
			},
			"ru": {
				"name": "новый параметр",
				"value":  "диагональ"
			}
		},
		"555F0BDF-70A4-4F39-A8C9-2E25B44EAF56":{
			"ua": {
				"name": "розмір",
				"value": "великий"
			},
			"ru": {
				"name": "размер",
				"value":  "большой"
			}
		}
	},

	"w":2077,
	"l":1830,
	"t": 16,
	"type": 1
}';

$o = json_decode($json, 1);
$ou = json_encode($o);

echo ($o["name"]["ru"]) . PHP_EOL;
echo($o["desc"]["ru"]);