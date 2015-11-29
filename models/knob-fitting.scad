// Copyright (c) 2015 W.A. Garrett Weaver

include<variables.scad>

// Derived variables
knobRadius = knobDiameter/2; 
mountRadius = knobRadius + wallWidth;
mountHeight = knobHeight + wallWidth; 
nutWidthPrime = 1.1547 * nutWidth; 

m = (servoLeverWidthAt4thHole - servoLeverWidthAtFirstHole) / (3 * servoLeverHoleDist); 
b = servoLeverWidthAtFirstHole - (m * servoLeverFirstHoleDistFromCenter); 
yMax = (m * servoLeverLength) + b; 


difference() {
    //This is the main cylinder 
    cylinder(h = mountHeight, r1 = mountRadius, r2 = mountRadius, center = false, $fn = 360);
    
    // Everything below here is an extrusion on the main cylinder 
    
    // This cuts out the space for the knob
    translate(v = [0, 0, -diffOffset]) {
        cylinder(h = knobHeight + diffOffset, r1 = knobRadius, r2 = knobRadius, center = false, $fn = 360);
    }
    
    // This cuts out a place for the Bake, Off and Broil lables to show
    translate(v = [0, 0, knobHeight]) {
        difference() {
            translate(v = [0, 0, -diffOffset/2]) {
                cylinder(h = wallWidth + diffOffset, r1 = sightHoleOuterRad, r2 = sightHoleOuterRadTop, center = false, $fn = 360);
            }
            translate(v = [0, 0, -diffOffset]) {
                cylinder(h = wallWidth + 2 *diffOffset, r1 = sightHoleInnerRad, r2 = sightHoleInnerRad, center = false, $fn = 360);
            }
            rotate([0, 0, 45]) {
                translate(v = [-sightHoleOuterRadTop, -bridgeWidth/2, -3*diffOffset/2]) {
                    cube([2*sightHoleOuterRadTop, bridgeWidth, wallWidth + 3*diffOffset], center=false);
                }
                translate(v = [-bridgeWidth/2, -sightHoleOuterRadTop, -3*diffOffset/2]) {
                    cube([bridgeWidth, 2*sightHoleOuterRadTop , wallWidth + 3*diffOffset], center=false);
                }
            }
        }
    }
    
    // This cuts out a hole for the washer and the screw on the side
    translate(v = [0, 0, knobHeight/2]) {
        rotate([90, 0, 0]) {
            cylinder(h = knobRadius + wallWidth + diffOffset, r1 = screwRadius, r2 = screwRadius, center = false, $fn = 360);
            cylinder(h = nutHeight + knobRadius, r1 = nutWidthPrime/2, r2 = nutWidthPrime/2, center = false, $fn = 6);
        }
    }
    
    translate(v = [0, -knobRadius - 5, knobHeight/2]) {
        rotate([90, 0, 0]) {
            cylinder(h = knobRadius + wallWidth + diffOffset, r1 = screwHeadRadius, r2 = screwHeadRadius, center = false, $fn = 360);
        }
    }
    
    // This cuts out a hole for the servo lever
    translate(v = [0, 0, knobHeight + wallWidth - servoLeverHeight]) {
        union() {
            for(a=[0:3]){
                rotate([0, 0, 45 + (90 * a)]) {
                    polyhedron(
                        points = [[0, b, 0], [servoLeverLength, yMax, 0], [servoLeverLength, -yMax, 0], [0, -b, 0], [0, b, servoLeverHeight], [servoLeverLength, yMax, servoLeverHeight], [servoLeverLength, -yMax, servoLeverHeight], [0, -b, servoLeverHeight]], 
                        faces = [ [3, 1, 0], [2, 1, 3], [1, 4, 0], [1, 5, 4], [4, 5, 7], [6, 7, 5], [7, 6, 3], [6, 2, 3], [0, 4, 3], [4, 7, 3], [5, 1, 2], [5, 2, 6]]
                    );
                }
            }
        }
    }
    // This cuts out a place to fit a credit card under to disloge 
    for(a=[0:3]){
        rotate([0, 0, 45 + (90 * a)]) {
            translate(v = [knobRadius + wallWidth, 0, knobHeight + wallWidth]) {
                rotate([0, -90, 0]) {
                    cylinder(h = 5, r1 = 3, r2 = 0, center = false, $fn = 360);
                }
            }
        }
    }
    // This cuts out some margin for the servo lever center 
    translate(v = [0, 0, knobHeight + wallWidth - servoLeverHeight - 2]) {
        cylinder(h = servoLeverHeight + 2, r1 = servoLeverFirstHoleDistFromCenter, r2 = servoLeverFirstHoleDistFromCenter, center = false, $fn = 360);
    }
}

