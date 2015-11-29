// This if for the part which fits over the knob
difference() {
    include<oven-fitting.scad>
    translate(v = [-plateWidth/2, -plateLength/2, 0]) {
        cube([plateWidth, plateLength, (mountHeight + knobOffset)], center=false);
            
    }
}