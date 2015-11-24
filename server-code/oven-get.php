<?php
	$file = 'oven.txt';
	
	if (file_exists($file)) {
		$handle = fopen($file, "r");
		
		$fileContents = fread($handle, filesize($file));
		
		fclose($handle);
		
		print "<" . $fileContents . ">";
	}
?>