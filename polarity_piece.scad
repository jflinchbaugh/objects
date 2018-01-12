// polarity game piece

diameter = 24.8; // mm
height = 4; // mm
cover = 0.8; // mm
lip = 0.8; // mm

min_cyl = 0.1; // mm

$fn=60;

difference() {
    union() {
        // main body
        minkowski() {
            cylinder(min_cyl, diameter / 2, diameter / 2);
            sphere((height + cover * 2) / 2);
        }
    }

    // slice out the hole, leaving the lip
    translate([0, 0, (height + min_cyl) / -2]) {
        cylinder(height, diameter/2, diameter/2);
        translate([0, 0, height ]) {
            cylinder(cover + min_cyl * 2, diameter/2, diameter/2-lip);
        }
    }
}
