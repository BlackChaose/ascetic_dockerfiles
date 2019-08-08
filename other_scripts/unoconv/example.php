<?php
/**
 * Sample use of Unoconv class
 *  
 */
require 'Unoconv.php';
 
use Unoconv\Unoconv;
 
// Converting to PDF
//$originFilePath = 'test.odt';
//$outputDirPath  = './';
//Unoconv::convertToPdf($originFilePath, $outputDirPath);
 
// Converting to DOCX
//$originFilePath = 'test.odt';
//$outputDirPath  = './';
//Unoconv::convert($originFilePath, $outputDirPath, 'docx');

function recursive($dir,$outdir)
{
   static $deep = 0;
   static $countDirs = 0;
   static $countFiles = 0;
 
   $odir = opendir($dir);
 
   while (($file = readdir($odir)) !== FALSE)
   {
      if ($file == '.' || $file == '..')
      {
         continue;
      }
      else
      {
		 if(!is_dir($dir.DIRECTORY_SEPARATOR.$file)){ 
			Unoconv::convertToPdf($dir.DIRECTORY_SEPARATOR.$file, $outdir.DIRECTORY_SEPARATOR.$file); 
			$countFiles++;
		}
         //echo str_repeat('---', $deep).$dir.DIRECTORY_SEPARATOR.$file.'<br>';
         echo str_repeat('---', $deep).$file.'<br>';
      }
 
      if (is_dir($dir.DIRECTORY_SEPARATOR.$file))
      {
		 $countDirs++; 
         $deep ++;
         $current_dir_name=$file;
         recursive($dir.DIRECTORY_SEPARATOR.$file,$outdir.DIRECTORY_SEPARATOR.$current_dir_name);
         $deep --;
      }
   }
      closedir($odir);
      return ['folders'=>$countDirs, 'files'=>$countFiles];
}

//$dir='/home/kalitins/DEV/WORK_TMP/17072019/output';
$dir = '/home/kalitins/DEV/WORK_TMP/30072019_281_odt/source';
//$output='/home/kalitins/DEV/WORK_TMP/17072019/output_pdf'; 
$output='/home/kalitins/DEV/WORK_TMP/30072019_281_odt/source/out';
$arr=recursive($dir,$output);
echo "папок: ".$arr['folders']." файлов: ".$arr['files']." <br>";
