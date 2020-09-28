width=19; // mm
height=3.5; // mm
battery_diameter=12; // mm
thickness=1.2; // mm
battery_height=6; // mm
length = battery_diameter - 5 * thickness;
rounding = 1; //mm

$fn=60;

difference() {
    // body
    minkowski() {
        translate([rounding, rounding, rounding]) {
            cube([
                width + 2 * thickness - 2 * rounding,
                height + 4 * thickness + battery_height - 2 * rounding,
                length - 2 * rounding
            ]);
        }
        sphere(r=rounding);
    }
 
    // slot
    translate([thickness, thickness, 0]) {
        cube([width, height, length]);
    }

    // battery
    translate([
        (width + 2 * thickness) / 2,
        height + 2 * thickness,
        length/2,
    ]) {
        rotate([-90, 0, 0]) {
            cylinder(
                d=battery_diameter,
                h=battery_height);
        }
    }
};
