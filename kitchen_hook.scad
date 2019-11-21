width=6.15; // mm
$fn=60;

linear_extrude(width) {
    difference() {
        translate([width / 2, width / 2]) {
            minkowski() {
                square([width * 2, width * 5]);
                circle(d=width);
            }
        }
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
        sphere(d=width * 2);
    }
}

translate([2 * width,5 * width,-2 * width]) {
    rotate([0,-90,90]) {
        linear_extrude(width) {
            difference() {
                translate([width / 2, width / 2]) {
                    minkowski() {
                        square([width * 2, width * 1]);
                        circle(d=width);
                    }
                }
                translate([0, width * 2]) {
                    square([width * 2, width]);
                }
                translate([width, width]) {
                    square([width, width * 2]);
                }
            }
        }
    }
}