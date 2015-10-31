difference() {
    cylinder(h = 25, r1 = 28, r2 = 28, center = false, $fn = 360);
    translate(v = [0, 0, -1]) {
        cylinder(h = 21, r1 = 25.25, r2 = 25.25, center = false, $fn = 360);
    }
}