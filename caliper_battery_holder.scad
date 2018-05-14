width=18; // mm
height=3; // mm
battery_diameter=11.5; // mm
thickness=1.2; // mm
battery_height=7; // mm
length = battery_diameter - 2 * thickness;
rounding = 1; //mm

$fn=60;

difference() {
    // body
    minkowski() {
        translate([rounding, rounding, rounding]) {
            cube([
                width + 2 * thickness - 2 * rounding, 
                height + 2 * thickness + battery_height - 2 * rounding,
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
                d1=battery_diameter, 
                d2=battery_diameter - 0.6, 
                h=battery_height); 
        }
    }    
};