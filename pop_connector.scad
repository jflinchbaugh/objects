$fn=8;
stick_thick=2.15;
stick_width = 9.42;
size=stick_width * 1.25;

difference() {   
    rotate([0,0,22.5]) {
        sphere(r=size);
    }
    plus();
    rotate([0,90,0]) {
        plus();
    }
    rotate([0,0,90]) {
        plus();
    }
}

module plus() {
        cube([size * 2, stick_width, stick_thick], true);
    rotate([90,0,0]) {
        cube([size * 2, stick_width, stick_thick], true);
    }
    rotate([45,0,0]) {
        cube([size * 2, stick_width / 2, stick_width / 2], true);
    }
}