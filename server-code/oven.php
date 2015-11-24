<?php
	if(!empty($_POST['status']) && !empty($_POST['temp'])){
		$data = $_POST['status'];
		$temp = $_POST['temp'];
		$fname = "oven.txt";//generates random name

		$file = fopen($fname, 'w');//creates new file
		fwrite($file, $data . "\n");
		fwrite($file, $temp);
		fclose($file);
	}
?>
