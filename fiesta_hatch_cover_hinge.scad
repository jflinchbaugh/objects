slot = 13;

difference() {
    cube([50,16,35]);
    translate([0,5,2]) {
        cube([(50-slot)/2-5,5,33]);
    }
    translate([(50+slot)/2 + 5,5,2]) {
        cube([(50-slot)/2-5,5,33]);
    }
    translate([0,5,21+2]) {
        cube([50,5,12]);
    }
    translate([(50-slot)/2, 0, 0]) {
        cube([slot,16,15]);
    }
    
    translate([(50/2), 0, 15]) {
        rotate([270,0,0]) {
            cylinder(r=slot/2,h=16);
        }
    }
    translate([5, 0, 30]) {
        rotate([270,0,0]) {
            cylinder(r=1.5,h=17);
            cylinder(r=1.8,h=8);
        }
    }
    translate([45, 0, 30]) {
        rotate([270,0,0]) {
            cylinder(r=1.5,h=17);
            cylinder(r=1.8,h=8);
        }
    }
}