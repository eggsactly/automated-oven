// Constants
knobDiameter = 51.50; 
wallWidth = 9; 
knobHeight = 16.5;
diffOffset = 1; 
sightHoleInnerRad=15.5;
sightHoleOuterRad=23.0;
sightHoleOuterRadTop=30.0;
bridgeWidth=11;
nutWidth=5.5; 
nutHeight=2.3;
washerRadius=4.4;
washerHeight=0.8;
screwRadius=2; 
servoLeverRadius=10.43;
servoLeverHeight=6.0; 
screwHeadRadius=3; 

//servoLeverRadius=13.7/2;
servoLeverHeight=6.0; 
servoLeverHoleDist=2.82; 
servoLeverFirstHoleDistFromCenter=6.75; 
servoLeverWidthAtFirstHole=4.25;
servoLeverWidthAt4thHole=3;
servoLeverLength=20;
mountHeight = knobHeight + wallWidth; 
bevelRadius = 5; 

margin=2;
knobRadius = knobDiameter/2; 
mountRadius = knobRadius + wallWidth + margin;

wallThickness=10; 
plateLength=93; 
plateWidth=2*mountRadius + wallThickness;
knobOffset=4.33;

difference() {
    translate(v = [-plateWidth/2 + bevelRadius/2, -plateLength/2 + bevelRadius/2, 0]) {
        minkowski()
        {
            cube([plateWidth - bevelRadius, plateLength - bevelRadius, (mountHeight + wallThickness + knobOffset)/2], center=false);
            cylinder(h = (mountHeight + wallThickness + knobOffset)/2, r1 = bevelRadius, r2 = bevelRadius, center = false, $fn = 360);
        }
    }
    cylinder(h = mountHeight + knobOffset, r1 = mountRadius + margin, r2 = mountRadius + margin, center = false, $fn = 360);
}