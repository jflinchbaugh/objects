$fn=40;

difference () {
    union() {
        cylinder(r=31/2, h=3);

        difference() {
            translate([(-22.3+4)/2, 0, 0]) {
                minkowski() {
                    cube([22.3-4, 12.5-4, 7-1]);
                    cylinder(r=2, h=1);
                }
            }
            translate([(-18.3+4)/2, 0, 0]) {
                minkowski() {
                    cube([18.3-4, 10.5-4, 7-1]);
                    cylinder(r=2, h=1);
                }
            }
        }
        translate([19/2, 0, 0]) {
            cylinder(r=4, h=7);
        }
        translate([-19/2, 0, 0]) {
            cylinder(r=4, h=7);
        }
    }
    union() {
        translate([19/2, 0, 0]) {
            cylinder(r=2.55/2, h=7);
            cylinder(r=6/2, h=4.5);
        }
        translate([-19/2, 0, 0]) {
            cylinder(r=2.55/2, h=7);
            cylinder(r=6/2, h=4.5);
        }    
    }
}