module slot() {
    translate([-1.5, -12.5, 0]) {
        cube([3, 25, 20]);
    }
}

module body() {
    cylinder(r1 = 14.8, r2 = 14.7, h = 24);
}

module peg() {
    cylinder(r = 7.5/2, h = 5);
}

module holder() {
    union() {
        difference() {
            body();
            for (i = [-5:5:+5]) {
                translate([i, 0, 0]) {
                    slot();
                }
            }       
        }
        translate([0, 0, 24]) {
            peg();
        }
    }
}

holder();