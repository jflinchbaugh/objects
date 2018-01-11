// polarity game piece

diameter = 24.9; // mm
height = 4; // mm
cover = 0.6;

$fn=60;

difference() {
    union() {
        // main body
        minkowski() {
            cylinder(0.1, diameter/2, diameter/2);
            sphere(height/2 + cover);
        }
    }

    // slice out the hole, leaving the lip
    translate([0, 0, (height/-2) + cover]) {
        cylinder(height, diameter/2, diameter/2);
        cylinder(height + cover, diameter/2-0.1, diameter/2-0.1);
    }
}
