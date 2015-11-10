include<variables.scad>

difference() {
    union(){      
         // This is for the servo mount 
        translate(v = [-servoEdgeToCenter - ((servoMountWidth - servoLength)/2), -(servoWidth + wallThickness)/2, knobOffset + mountHeight]) {
            cube([servoMountWidth + wallThickness, servoWidth + wallThickness, servoHeight + wallThickness], center=false);
        }
        // This if for the part which fits over the knob
        translate(v = [-plateWidth/2 + bevelRadius/2, -plateLength/2 + bevelRadius/2, 0]) {
            minkowski()
            {
                cube([plateWidth - bevelRadius, plateLength - bevelRadius, (mountHeight + wallThickness + knobOffset)/2], center=false);
                cylinder(h = (mountHeight + wallThickness + knobOffset)/2, r1 = bevelRadius, r2 = bevelRadius, center = false, $fn = 360);
            }
        }
    }
    // This cuts out the space for the knob
    cylinder(h = mountHeight + knobOffset, r1 = mountRadius + margin, r2 = mountRadius + margin, center = false, $fn = 360);
    
    // This cuts out a place for the servo
    translate(v = [-servoEdgeToCenter + wallThickness/2, -(servoWidth)/2, knobOffset + mountHeight]) {
        cube([servoLength, servoWidth, servoHeight], center=false);
    }
    
    //This cuts out a place for the servo below the part where we have the mounts 
    translate(v = [-servoEdgeToCenter + wallThickness/2 - ((servoMountWidth - servoLength)/2), -(servoWidth)/2, 0]) {
        cube([servoMountWidth, servoWidth, servoMountDistToBody + knobOffset + mountHeight], center=false);
    }
    
    //This cuts off the top for the servo mount
    translate(v = [-servoEdgeToCenter - ((servoMountWidth - servoLength)/2), -(servoWidth + wallThickness)/2, knobOffset + mountHeight + servoHeight]) {
        cube([servoMountWidth + wallThickness, servoWidth + wallThickness, wallThickness], center=false);
    }
}