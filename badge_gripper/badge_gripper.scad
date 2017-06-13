width = 7;
slot = 0.85;
height = width * 2;
tooth_height = (width - 2)/2;
tooth_step = tooth_height - (slot/2)/2;

inside = false;
shell = true;

if (inside) {
    linear_extrude(height) {
        difference() {
            square([height, width]);
            translate([height - 1 - tooth_height, (width - (slot + 0.1)) / 2]) {
                square([tooth_height, slot + 0.1]);
            }
            for (i = [tooth_height:tooth_step:height-1]) {
                polygon([[i, width/2], [i-tooth_height, 1], [i-tooth_height,width-1]]);
            }
        }
    }
}

hole_width = width;
hole_height = height + 1;

if (shell) {
    difference() {
        cube([hole_height + 3, hole_width + 4, hole_height + 2]);
        translate([1,2,1]) {
            cube([hole_height, hole_width, hole_height + 2]);
        }
        translate([1,2,1]) {
            cube([hole_height, hole_width, hole_height + 2]);
        }
        translate([0, (hole_width + 4 - slot * 2) / 2, 0]) {
            cube([hole_height, slot * 2, hole_height + 2]);
        }
    }
    difference() {
        translate([hole_height + 3, 0, 0]) {
            cube([7, 3, hole_height + 2]);
        }
        translate([hole_height + 3, 0, 4]) {
            cube([4, 3, hole_height + 2 - 8]);
        }
    }
}
