<?php
namespace FSU;
use Tightenco\Collect;
class Diff{
	
private $dir = '/home/kalitins/DEV/WORK_TMP/17072019/update/output_filter';
private $dirInput = '/home/kalitins/DEV/WORK_TMP/17072019/update/input2';
private $dirOutput = '/home/kalitins/DEV/WORK_TMP/17072019/update/output_filter_files';
public function getArrs(){
		
	$file_1 = file_get_contents($this->dir.'/list1');
	$file_2 = file_get_contents($this->dir.'/list2');

	$arr_1 = explode("\n",$file_1);
	$arr_2 = explode("\n",$file_2);
	
	//~ echo var_export($arr_1, true);
	//~ echo var_export($arr_2, true);
	
	return ["arr1"=>$arr_1,"arr2"=>$arr_2];
	}
	
public function getDiff($arr){
	
	$arr1 = collect($arr['arr1']);
	$arr2 = collect($arr['arr2']);
	
	$diff = $arr2->diff($arr1);
	echo "\n".$diff->count()."\n";
	echo var_export($diff->toArray(),true);
	
	return $diff->toArray();
	}
	
public function copyFiles($arrItems){
		$pathFrom = $this->dirInput;
		$pathTo = $this->dirOutput;
		$cnt = 0;
		
		$t = collect($arrItems)->each(function($el) use($pathFrom, $pathTo, $cnt){
				if(!copy($pathFrom.'/'.$el, $pathTo.'/'.$el)){
					echo "file not copied!!!\n";
					}
				else {
					echo "file ".$el."are copied!\n";
					$cnt+=1;
					}
			});
		echo "copied ".$cnt." files!\n";
		return $cnt;
	}
}
