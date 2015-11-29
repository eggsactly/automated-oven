// Copyright (c) 2015 W.A. Garrett Weaver

include<variables.scad>
nutWidthPrime = 1.1547 * nutWidth; 
union() {
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
        translate(v = [-servoEdgeToCenter + wallThickness/2 - ((servoMountWidth - servoLength)/2), -(servoWidth)/2, mountHeight]) {
            cube([servoMountWidth, servoWidth, servoMountDistToBody + knobOffset], center=false);
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
                    translate(v = [0, 0, bevelRadius + 0.70 * (knobOffset + mountHeight)/2]) {
                        cylinder(h =  knobOffset + mountHeight + 2 * wallThickness + servoHeight, r1 = screwRadius, r2 = screwRadius, center = false, $fn = 360);
                    }
                    translate(v = [0, 0, knobOffset + mountHeight + servoHeight - wallThickness - servoMountHexNutDistFromTop]) {
                        cylinder(h = servoMountHexNutDistFromTop + wallThickness, r1 = nutWidthPrime/2, r2 = nutWidthPrime/2, center = false, $fn = 6);
                    }
                }
            }
        }
        
        // Cut out holes for the sides 
        translate(v = [bevelRadius - (1 * knobDiameter)/2, -plateLength/2 - wallThickness, (bevelRadius + 0.70 * (knobOffset + mountHeight))/2]) {
            minkowski() {
                cube([1 * knobDiameter - 2*bevelRadius, plateLength/2 + wallThickness, 0.65 * (knobOffset + mountHeight) - 2*bevelRadius], center=false);
                rotate([-90, 0, 0]) {
                    cylinder(h = plateLength/2 + wallThickness, r1 = bevelRadius, r2 = bevelRadius, center = false, $fn = 360);
                }
            }
        }
        rotate([0, 0, 90]) {
            translate(v = [bevelRadius - (1 * knobDiameter)/2, -plateLength/2 - wallThickness, (bevelRadius + 0.70 * (knobOffset + mountHeight))/2]) {
                minkowski() {
                    cube([1 * knobDiameter - 2*bevelRadius, plateLength/2 + wallThickness, 0.65 * (knobOffset + mountHeight) - 2*bevelRadius], center=false);
                    rotate([-90, 0, 0]) {
                        cylinder(h = plateLength/2 + wallThickness, r1 = bevelRadius, r2 = bevelRadius, center = false, $fn = 360);
                    }
                }
            }
        }
        
        // Cut out holes for M2 screws
        for(a=[0:1]) {
            for(b=[0:1]) {
                translate(v = [(b * (plateWidth - 2*wallThickness)) - (plateWidth - 2*wallThickness)/2, (a * (plateLength - 2*wallThickness)) - (plateLength - 2*wallThickness)/2, 0]) {
                    translate(v = [0, 0, mountHeight + wallThickness - m2HeadHeight + knobOffset]) {
                        cylinder(h = m2HeadHeight, r1 = m2HeadDiameter/2, r2 = m2HeadDiameter/2, center = false, $fn = 360);
                    }
                    
                    cylinder(h = mountHeight + wallThickness + knobOffset, r1 = m2ThreadDiameter/2, r2 = m2ThreadDiameter/2, center = false, $fn = 360);
                    
                }
            }
        }
        rotate([0, 0, 180]) {
            // This cuts out a place for the Bake, Off and Broil lables to show when they're on 
            translate(v = [0, 0, mountHeight + knobOffset - 1]) {
                difference() { 

                    translate(v = [0, 0, 0]) {
                        cylinder(h = wallThickness + 1, r1 = sightHoleOuterRadTop, r2 = mountRadius, center = false, $fn = 360);
                    }
                        
                    
                    // This part is the 3/4ths of a pie to diff out the diff of the hole 
                    rotate([0, 0, 45]) {
                        cube([plateLength, plateLength, servoHeight + wallThickness + mountHeight + knobOffset], center=false);
                        translate(v = [0, -plateLength, 0]) {
                            cube([plateLength, plateLength, servoHeight + wallThickness + mountHeight + knobOffset], center=false);
                        }
                        translate(v = [-plateLength, 0, 0]) {
                            cube([plateLength, plateLength, servoHeight + wallThickness + mountHeight + knobOffset], center=false);
                        }
                    }
                }
            }
        }
    }

    translate(v = [0, 0, mountHeight + knobOffset]) {
        translate(v = [-plateLength/2, servoWidth/2 , 0]) {
            cube([plateLength, wallThickness/2, wallThickness], center=false);
        }
    }
}