diameter = 88; 
height = 72; // [18:]

ring = true;
handle = true;

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
difference() {
    union() {
        rotate([90,0,0]) {
            translate([0, 7.5, -(diameter + 22) / 2]) {
                cylinder((diameter + 22), 2.4, 2.4);
            }
        }
        translate([-2.4, -diameter / 2 - 4.8, 7.5]) {
            cube([4.8, 4.8, 15]);
        }
        translate([-2.4, -diameter / 2 - 9.6, 17]) {
            cube([4.8, 4.8, height - 12]);
        }
        translate([-2.4, diameter / 2, 7.5]) {
            cube([4.8, 4.8, 15]);
        }
        translate([-2.4, diameter / 2 + 4.8, 17]) {
            cube([4.8, 4.8, height - 12]);
        }
        translate([-2.4, -(diameter + 15) / 2, height]) {
            cube([4.8, (diameter) + 15, 5]);
        }        
    }
    translate([-3, -(diameter) / 2, 5]) {
        cube([6, (diameter), 5]);
    }
}
}