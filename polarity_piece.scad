// polarity game piece

diameter = 25; // mm
height = 4; // mm

$fn=60;

difference() {
    union() {
        // main body
        minkowski() {
            cylinder(0.1, diameter/2, diameter/2);
            sphere(height/2+0.5);
        }
    }

    // slice out the hole, leaving the lip
    translate([0,0,(height/-2)+0.5]) {
        cylinder(height+0.5, diameter/2, diameter/2);
    }
}
