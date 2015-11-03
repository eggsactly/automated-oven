// Units are in millimeters

// Constants
knobDiameter = 50.50; 
wallWidth = 10; 
knobHeight = 16.5;
diffOffset = 1; 
sightHoleInnerRad=15.5;
sightHoleOuterRad=21.0;
bridgeWidth=10;
nutWidth=5.5; 
nutHeight=2.3;
washerRadius=4.4;
washerHeight=0.8;
screwRadius=1.45; 
servoLeverRadius=10.43;
servoLeverHeight=6.0; 
screwHeadRadius=3; 

//servoLeverRadius=13.7/2;
servoLeverHeight=6.0; 
servoLeverHoleDist=2.82; 
servoLeverFirstHoleDistFromCenter=8.00; 
servoLeverWidthAtFirstHole=8.00;
servoLeverWidthAt4thHole=5.4;
servoLeverLength=19.4;


// Derived variables
knobRadius = knobDiameter/2; 
mountRadius = knobRadius + wallWidth;
mountHeight = knobHeight + wallWidth; 



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
                cylinder(h = wallWidth + diffOffset, r1 = sightHoleOuterRad, r2 = sightHoleOuterRad, center = false, $fn = 360);
            }
            translate(v = [0, 0, -diffOffset]) {
                cylinder(h = wallWidth + 2 *diffOffset, r1 = sightHoleInnerRad, r2 = sightHoleInnerRad, center = false, $fn = 360);
            }
            rotate([0, 0, 45]) {
                translate(v = [-sightHoleOuterRad, -bridgeWidth/2, -3*diffOffset/2]) {
                    cube([2*sightHoleOuterRad, bridgeWidth, wallWidth + 3*diffOffset], center=false);
                }
                translate(v = [-bridgeWidth/2, -sightHoleOuterRad, -3*diffOffset/2]) {
                    cube([bridgeWidth, 2*sightHoleOuterRad , wallWidth + 3*diffOffset], center=false);
                }
            }
        }
    }
    
    // This cuts out a hole for the washer and the screw on the side
    translate(v = [0, 0, knobHeight/2]) {
        rotate([90, 0, 0]) {
            cylinder(h = knobRadius + wallWidth + diffOffset, r1 = screwRadius, r2 = screwRadius, center = false, $fn = 360);
            cylinder(h = nutHeight + knobRadius, r1 = nutWidth/2, r2 = nutWidth/2, center = false, $fn = 6);
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
            rotate([0, 0, 45]) {
                polyhedron(
                    points = [[0, 5.1584, 0], [19.4, 1.9480, 0], [19.4, -1.9480, 0], [0, -5.1584, 0], [0, 5.1584, servoLeverHeight], [19.4, 1.9480, servoLeverHeight], [19.4, -1.9480, servoLeverHeight], [0, -5.1584, servoLeverHeight]], 
                    faces = [ [3, 1, 0], [2, 1, 3], [1, 4, 0], [1, 5, 4], [4, 5, 7], [6, 7, 5], [7, 6, 3], [6, 2, 3], [0, 4, 3], [4, 7, 3], [5, 1, 2], [5, 2, 6]]
                );
            }
            rotate([0, 0, 135]) {
                polyhedron(
                    points = [[0, 5.1584, 0], [19.4, 1.9480, 0], [19.4, -1.9480, 0], [0, -5.1584, 0], [0, 5.1584, servoLeverHeight], [19.4, 1.9480, servoLeverHeight], [19.4, -1.9480, servoLeverHeight], [0, -5.1584, servoLeverHeight]], 
                    faces = [ [3, 1, 0], [2, 1, 3], [1, 4, 0], [1, 5, 4], [4, 5, 7], [6, 7, 5], [7, 6, 3], [6, 2, 3], [0, 4, 3], [4, 7, 3], [5, 1, 2], [5, 2, 6]]
                );
            }
            rotate([0, 0, -45]) {
                polyhedron(
                    points = [[0, 5.1584, 0], [19.4, 1.9480, 0], [19.4, -1.9480, 0], [0, -5.1584, 0], [0, 5.1584, servoLeverHeight], [19.4, 1.9480, servoLeverHeight], [19.4, -1.9480, servoLeverHeight], [0, -5.1584, servoLeverHeight]], 
                    faces = [ [3, 1, 0], [2, 1, 3], [1, 4, 0], [1, 5, 4], [4, 5, 7], [6, 7, 5], [7, 6, 3], [6, 2, 3], [0, 4, 3], [4, 7, 3], [5, 1, 2], [5, 2, 6]]
                );
            }
            rotate([0, 0, -135]) {
                polyhedron(
                    points = [[0, 5.1584, 0], [19.4, 1.9480, 0], [19.4, -1.9480, 0], [0, -5.1584, 0], [0, 5.1584, servoLeverHeight], [19.4, 1.9480, servoLeverHeight], [19.4, -1.9480, servoLeverHeight], [0, -5.1584, servoLeverHeight]], 
                    faces = [ [3, 1, 0], [2, 1, 3], [1, 4, 0], [1, 5, 4], [4, 5, 7], [6, 7, 5], [7, 6, 3], [6, 2, 3], [0, 4, 3], [4, 7, 3], [5, 1, 2], [5, 2, 6]]
                );
            }
        }
    }
    
    // This cuts out some margin for the servo lever center 
    translate(v = [0, 0, knobHeight + wallWidth - servoLeverHeight - 2]) {
        cylinder(h = servoLeverHeight + 2, r1 = servoLeverFirstHoleDistFromCenter, r2 = servoLeverFirstHoleDistFromCenter, center = false, $fn = 360);
    }
}

