<?php
/* Copyright (c) 2015 W.A. Garrett Weaver
 * This file is part of automated-oven
 *
 * automated-oven is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * automated-oven is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with automated-oven.  If not, see <http://www.gnu.org/licenses/>.
 */ 

	$file = 'oven.txt';
	
	if (file_exists($file)) {
		$handle = fopen($file, "r");
		
		$fileContents = fread($handle, filesize($file));
		
		fclose($handle);
		
		print "<" . $fileContents . ">";
	}
?>