height = 30;
twist = 180;
floor = 1;

$fn=120;
linear_extrude(height = height, twist = twist) {
    translate([-5,-5]) {
        difference() {
            square(10);
            translate([1, 1]) {
                square(8);
            }
        }
    }
}

linear_extrude(height = floor, twist = floor/height * twist) {
    translate([-5, -5]) {
        square(10);
    }
}