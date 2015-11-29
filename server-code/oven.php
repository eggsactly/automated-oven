<?php
	// Copyright (c) 2015 W.A. Garrett Weaver

	if(!empty($_POST['status']) && !empty($_POST['temp'])){
		$data = $_POST['status'];
		$temp = $_POST['temp'];
		$fname = "oven.txt";

		$file = fopen($fname, 'w');
		fwrite($file, $data . "\n");
		fwrite($file, $temp);
		fclose($file);
	}
?>
