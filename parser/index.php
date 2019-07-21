<?php
require 'vendor/autoload.php';
//ini_set('display_errors', 1);
//error_reporting(E_ALL);

//ini_set('display_errors', '1');
//require_once('phpQuery/phpQuery.php');

$year = 2016;
print  '<table>';

for($i = 0; $i < 12; $i += 1){
	$path = 'https://www.gismeteo.ru/diary/4368/'.$year.'/'.$i.'/';
	$var = file_get_contents($path);
	$doc = phpQuery::newDocumentHTML($var);
	$arr = [];
	array_push($arr,pq('#page_title')->textContent);
	foreach (pq('table > tbody > tr[align="center"] ') as $el){
		array_push($arr,$el);		
	}


	for($i =0; $i < count($arr); $i++){
		print "<tr>";
		print "<td>";
		print_r($arr[$i]);
		print "</td>";
		print "</tr>";
	}
}
print "</table>";
