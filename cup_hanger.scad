// a ring and handle to go around a travel mug or cup

diameter = 88; // diameter of cup where the ring should catch
height = 70; // mm, height of handle

ring = true; // render ring?
handle = true; // render handle?

$fn=60;

if (ring) {
    difference() {
        union() {
            cylinder(5, (diameter+10)/2, (diameter+10)/2);
            rotate([90,0,0]) {
                translate([0, 7.5, -(diameter + 20) / 2]) {
                    cylinder(diameter + 20, 7.5, 7.5);
                }
                translate([-7.5, 0, -(diameter + 20) / 2]) {
                    cube([15, 7.5, diameter + 20]);
                }
            }
        }
        translate([0, 0, -1]) {
            cylinder(12, diameter / 2, diameter / 2);
        }
        rotate([90,0,0]) {
            translate([0, 7.5, -(diameter + 21) / 2]) {
                cylinder((diameter + 22), 2.5, 2.5);
            }
        }
        translate([0, 0, 5]) {
            cylinder(11, (diameter+10)/2, (diameter+10)/2);
        }
    }
}

if (handle) {
    translate([(diameter + 30) / PI, 0, 2.4]) {
        difference() {
            union() {
                rotate([90,0,0]) {
                    translate([0, 0, -(diameter + 22) / 2]) {
                        cylinder((diameter + 22), 2.4, 2.4);
                    }
                }
                translate([0, -diameter / 2 - 4.8, -2.4]) {
                    cube([15, 4.8, 4.8]);
                }
                translate([9, -diameter / 2 - 9.6, -2.4]) {
                    cube([height, 4.8, 4.8]);
                }
                translate([0, diameter / 2, -2.4]) {
                    cube([15, 4.8, 4.8]);
                }
                translate([9, diameter / 2 + 4.8, -2.4]) {
                    cube([height, 4.8, 4.8]);
                }
                translate([height + 4, -(diameter + 15) / 2, -2.4]) {
                    cube([5, (diameter) + 15, 4.8]);
                }
            }
            translate([-3, -(diameter) / 2, -2.5]) {
                cube([6, (diameter), 5]);
            }
        }
    }
}