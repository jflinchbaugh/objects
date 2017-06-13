// params
width = 8;
slot = 0.85;
height = width * 2;
tooth_scaling = 0.5;
part_tolerance = 0.1;

// choose which pieces to render
inside = true;
shell = true;


// calcs
tooth_height = (width - 2)/2;
tooth_step = tooth_height - (slot * tooth_scaling)/2;

if (inside) {
    translate([1, 0, 0]) {
        linear_extrude(height) {
            difference() {
                square([height, width]);
                // top slot
                translate([height - 1 - tooth_height, (width - (slot + 0.1)) / 2]) {
                    square([tooth_height, slot + 0.1]);
                }
                // teeth
                for (i = [tooth_height:tooth_step:height-1]) {
                    polygon([[i, width/2], [i-tooth_height, 1], [i-tooth_height,width-1]]);
                }
            }
        }
    }
}

if (shell) {
    hole_width = width + part_tolerance * 2;
    hole_height = height + part_tolerance * 2;

    translate([0, width * 2, 0]) {
        // shell
        difference() {
            cube([hole_height + 3, hole_width + 4, hole_height + 2]);
            translate([1,2,1]) {
                cube([hole_height, hole_width, hole_height + 1]);
            }
            translate([0, (hole_width + 4 - slot * 2) / 2, 0]) {
                cube([hole_height, slot * 2, hole_height + 2]);
            }
        }
        // top loop
        difference() {
            translate([hole_height + 3, 0, 0]) {
                cube([7, 3, hole_height + 2]);
            }
            translate([hole_height + 3, 0, 4]) {
                cube([4, 3, hole_height + 2 - 8]);
            }
        }
    }
}
