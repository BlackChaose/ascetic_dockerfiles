<?php
use FSU\Diff;

require 'vendor/autoload.php';

ini_set('display_errors', 1);
error_reporting(E_ALL);

$df = new FSU\Diff();

$df->copyFiles($df->getDiff($df->getArrs()));
