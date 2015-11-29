oven-project contains models and code to implement a mount for a 1980s era Hotpoint electric range to control the oven with a smartphone. 

To compile the code to machine readable form you will need to download and install the Arduino IDE
https://www.arduino.cc/en/Main/Software
You will also need to download and install OpenSCAD to render the models:
http://www.openscad.org/downloads.html

oven-project-parts.xml is a spreadsheet containing an itemized list of the parts needed to create the mount.
app/ contains an AJAX webpage a smartphone shall run to control the oven.
datasheets/ contains data sheets of parts used on the project.
firmware/ contains code that runs on the Arduino Ethernet. 
manuals/ contains technical references.
models/ contains OpenSCAD models of the physical oven mounts that are rendered to .stl files and 3D printed.
server-code/ contains code that runs on a server that coordinates communication between the smartphone and the Arduino.