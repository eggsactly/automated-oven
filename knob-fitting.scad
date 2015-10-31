// Units are in millimeters

// Constants
knobDiameter = 50.50; 
wallWidth = 5; 
knobHeight = 16.5;
diffOffset = 1; 
sightHoleInnerRad=15.5;
sightHoleOuterRad=21.0;
bridgeWidth=10;


// Derived variables
knobRadius = knobDiameter/2; 
mountRadius = knobRadius + wallWidth;
mountHeight = knobHeight + wallWidth; 


difference() {
    cylinder(h = mountHeight, r1 = mountRadius, r2 = mountRadius, center = false, $fn = 360);
    translate(v = [0, 0, -diffOffset]) {
        cylinder(h = knobHeight + diffOffset, r1 = knobRadius, r2 = knobRadius, center = false, $fn = 360);
    }
    
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
}