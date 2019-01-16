width=6.15; // mm

linear_extrude(width) {
    difference() {
        square([width * 3, width * 7]);
        translate([0, width * 2]) {
            square([width * 2, width]);
        }
        translate([width, width]) {
            square([width, width * 2]);
        }
        translate([width, width * 4]) {
            square([width * 2, width]);
        }
        translate([width, width * 4]) {
            square([width, width * 2]);
        }
    }
}