include<variables.scad>
nutWidthPrime = 1.1547 * nutWidth; 
difference() {
    union() {      
         // This is for the servo mount 
        translate(v = [bevelRadius - servoEdgeToCenter - ((servoMountWidth - servoLength)/2), bevelRadius - (servoWidth + wallThickness)/2, knobOffset + mountHeight]) {
            minkowski()
            {
                cube([servoMountWidth + wallThickness - 2*bevelRadius, servoWidth + wallThickness - 2*bevelRadius, (servoHeight + wallThickness)/2], center=false);
                cylinder(h = (servoHeight + wallThickness)/2, r1 = bevelRadius, r2 = bevelRadius, center = false, $fn = 360);
            }
        }
        // This if for the part which fits over the knob
        translate(v = [-plateWidth/2 + bevelRadius, -plateLength/2 + bevelRadius, 0]) {
            minkowski()
            {
                cube([plateWidth - 2*bevelRadius, plateLength - 2*bevelRadius, (mountHeight + wallThickness + knobOffset)/2], center=false);
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
    
    // This cube cuts out a place for the servo wire mount to slide up on
    translate(v = [-servoEdgeToCenter, -servoWireMountWidth/2, knobOffset + mountHeight]) {
        cube([((servoMountWidth - servoLength)/2), servoWireMountWidth, knobOffset + mountHeight + wallThickness], center=false);
    }
    
    // This cuts out a space for the servo control wire to stick out 
    translate(v = [-servoEdgeToCenter - (servoMountWidth - servoLength)/2, -(servoWireMountWidth+3)/2, knobOffset + mountHeight + servoHeight - servoBottomToServoWire]) {
        cube([(servoMountWidth - servoLength), servoWireMountWidth + 3, servoBottomToServoWire], center=false);
    }
    
    // Cut out a space for the screws to use to mount the servo on 
    for(a=[0:1]) {
        for(b=[0:1]) {
            translate(v = [-servoEdgeToCenter + wallThickness/2 - ((servoMountWidth - servoLength)/4) + (a * (servoMountWidth - ((servoMountWidth - servoLength)/2))), (b * servoMountHoleDist) - (servoMountHoleDist/2), 0]) {
                cylinder(h =  knobOffset + mountHeight + 2 * wallThickness + servoHeight, r1 = screwRadius, r2 = screwRadius, center = false, $fn = 360);
                translate(v = [0, 0, knobOffset + mountHeight + servoHeight - wallThickness - servoMountHexNutDistFromTop]) {
                    cylinder(h = servoMountHexNutDistFromTop + wallThickness, r1 = nutWidthPrime/2, r2 = nutWidthPrime/2, center = false, $fn = 6);
                }
            }
        }
    }
}