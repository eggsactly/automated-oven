<?php
	// Copyright (c) 2015 W.A. Garrett Weaver

	$file = 'oven.txt';
	
	if (file_exists($file)) {
		$handle = fopen($file, "r");
		
		$fileContents = fread($handle, filesize($file));
		
		fclose($handle);
		
		print "<" . $fileContents . ">";
	}
?>