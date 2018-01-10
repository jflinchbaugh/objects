// sleeve case for hanging a ruuvi tag

diameter = 52; // mm
height = 12.3; // mm
wall = 2; // mm

$fn=60;

difference() {
    union() {
        // main body
        cylinder(height + wall * 2, diameter/2 + wall, diameter/2 + wall);
        // hanger loop
        translate([diameter/2 + wall * 2, 0, 0]) {
            difference() {
                cylinder(3, 5, 5);
                cylinder(3, 3, 3);
            }
        }
    }

    // slice out the hole, leaving the lip
    cylinder(height + wall * 2, diameter/2 - wall, diameter/2 - wall);
    translate([0, 0, wall]) {
        cylinder(height, diameter/2, diameter/2);
    }
    translate([0,0, wall + height]) {
        cylinder(wall, diameter/2, diameter/2 - wall/2);
    }
}
