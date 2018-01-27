battery_diameter = 14.1;
thickness = 1.2;
arm_length = 15;
$fn=30;

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
                translate([arm_length, thickness / 2]) {
                    circle(thickness * 2);
                }            }
            translate([0, 0 - (battery_diameter / 2 + arm_length + thickness)]) {
                square([arm_length, thickness]);
                translate([arm_length, thickness / 2]) {
                    circle(thickness * 2);
                }
            }
        }
        circle(battery_diameter / 2);
    }
}