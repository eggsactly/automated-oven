// Units are in millimeters

// Constants
knobDiameter = 50.50; 
wallWidth = 5; 
knobHeight = 16.5;
diffOffset = 1; 

// Derived variables
knobRadius = knobDiameter/2; 
mountRadius = knobRadius + wallWidth;
mountHeight = knobHeight + wallWidth; 


difference() {
    cylinder(h = mountHeight, r1 = mountRadius, r2 = mountRadius, center = false, $fn = 360);
    translate(v = [0, 0, -diffOffset]) {
        cylinder(h = knobHeight + diffOffset, r1 = knobRadius, r2 = knobRadius, center = false, $fn = 360);
    }
}