width=6.15; // mm
$fn=60;

linear_extrude(width) {
    difference() {
        square([width * 3, width * 6]);
        translate([0, width * 2]) {
            square([width * 2, width]);
        }
        translate([width, width]) {
            square([width, width * 2]);
        }
    }
}
translate([1.5 * width, 4.5 * width, 0]) {
    cylinder(d=width, h = width * 3);
    translate([0, 0, width * 3]) {
        sphere(d=width * 1.5);
    }
}