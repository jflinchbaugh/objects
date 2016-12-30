module handle(holeDiameter) {
    difference() {
        union() {
            cylinder(r1 = 5, r2 = 15, h = 30);
            cylinder(r1 = 7, r2 = 6, h= 3);
            translate([0, 0, 30]) {
                cylinder(r1 = 15, r2=14, h=2);
            }
        }
        cylinder(r = holeDiameter, h=25);
    }
}

handle(2.25);