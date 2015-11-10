include<variables.scad>

difference() {
    union(){        
        translate(v = [-servoEdgeToCenter - ((servoMountWidth - servoLength)/2), -(servoWidth + wallThickness)/2, knobOffset + mountHeight]) {
            cube([servoMountWidth + wallThickness, servoWidth + wallThickness, servoHeight + wallThickness], center=false);
        }
        translate(v = [-plateWidth/2 + bevelRadius/2, -plateLength/2 + bevelRadius/2, 0]) {
            minkowski()
            {
                cube([plateWidth - bevelRadius, plateLength - bevelRadius, (mountHeight + wallThickness + knobOffset)/2], center=false);
                cylinder(h = (mountHeight + wallThickness + knobOffset)/2, r1 = bevelRadius, r2 = bevelRadius, center = false, $fn = 360);
            }
        }
    }
    cylinder(h = mountHeight + knobOffset, r1 = mountRadius + margin, r2 = mountRadius + margin, center = false, $fn = 360);
    
    translate(v = [-servoEdgeToCenter + wallThickness/2, -(servoWidth)/2, knobOffset + mountHeight]) {
        cube([servoLength, servoWidth, servoHeight], center=false);
    }
    
    translate(v = [-servoEdgeToCenter + wallThickness/2 - ((servoMountWidth - servoLength)/2), -(servoWidth)/2, knobOffset + mountHeight]) {
        cube([servoMountWidth, servoWidth, servoMountDistToBody], center=false);
    }
}