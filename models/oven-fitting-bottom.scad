// Copyright (c) 2015 W.A. Garrett Weaver

// This if for the part which fits over the knob
difference() {
    include<oven-fitting.scad>
    translate(v = [-plateWidth/2, -plateLength/2, mountHeight + knobOffset]) {
        cube([plateWidth, plateLength, servoHeight + wallThickness], center=false);
            
    }
}