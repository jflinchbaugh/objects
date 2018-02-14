battery_diameter = 14.1;
thickness = 1.2;
arm_length = 15;
$fn=30;

// the arms
linear_extrude(thickness) {
    difference() {
        union() {
            circle(battery_diameter / 2 + thickness);
            square(
                [
                    thickness,
                    battery_diameter + arm_length * 2 + thickness * 2
                ], 
                true
            );
            translate([0, battery_diameter / 2 + arm_length]) {
                square([arm_length, thickness]);
                translate([arm_length + thickness * 2, thickness / 2]) {
                    difference() {
                        circle(thickness * 2.5);
                        square([thickness, thickness * 3], true);
                    }
                }            }
            translate([
                0, 
                0 - (battery_diameter / 2 + arm_length + thickness)
            ]) {
                square([arm_length, thickness]);
                translate([arm_length + thickness * 2, thickness / 2]) {
                    difference() {
                        circle(thickness * 2.5);
                        square([thickness, thickness * 3], true);
                        square([thickness * 3, thickness], true);
                    }
                }
            }
        }
        circle(battery_diameter / 2);
    }
}

// the feet
translate([battery_diameter * 1.5, 0, 0]) {
    linear_extrude(thickness * 3) {
        difference() {
            union() {
                circle(battery_diameter / 2 + thickness);
                translate([
                    battery_diameter / 2, 
                    battery_diameter / 2, 0
                ]) {
                    circle(battery_diameter / 3);
                }
                translate([
                    battery_diameter / 2, 
                    0 - battery_diameter / 2, 0
                ]) {
                    circle(battery_diameter / 3);
                }
            }
            circle(battery_diameter / 2);
        }
    }
}

// head
translate([0 - battery_diameter * 1.5, 0, 0]) {
    difference() {
        linear_extrude(15) {
            difference() {
                union() {
                    circle(battery_diameter / 2 + thickness);
                }
                circle(battery_diameter / 2);
            }
        }
        // hair
        translate([0,0,15]) {
            for (spin = [0:20:180]) {
                rotate([45, 0, spin]) {
                    cube([battery_diameter + thickness * 2, 2, 2], true);
                }
            }
        }
        translate([2,0,6]) {
            for (spin = [-20:40:20]) {
                rotate([45, 0, spin]) {
                    cube([battery_diameter + thickness * 2, 2, 2], true);
                }
            }
        }
    }
}
