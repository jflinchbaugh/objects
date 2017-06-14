// a friction-based badge holder made of of a TPU core and a PLA shell

// parameters
// ----------

width = 8; // mm, width of TPU core
height = width * 2; // mm, height of TPU core
slot = 0.85; // mm, width of card slot in TPU core
tooth_scaling = 0.5; // multiplier, scale teeth to be tighter than slot
part_tolerance = 0.1; // mm, tolerance gap allowed by shell around core

// choose which pieces to render, since they are different materials
inside = true;
shell = true;

// ----------

// calculations for gap between teeth based on stack of right triangles
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
    hole_height = height+ part_tolerance * 2;
    hole_extra_height = 0.5;

    translate([0, width * 2, 0]) {
        // shell
        difference() {
            // main shell
            cube([hole_height + 3 + hole_extra_height, hole_width + 4, hole_height + 2]);
            // cut out big hole
            translate([1,2,1]) {
                cube([hole_height + hole_extra_height, hole_width, hole_height + 1]);
            }
            // cut out card slot
            translate([0, (hole_width + 4 - slot * 2) / 2, 0]) {
                cube([hole_height, slot * 2, hole_height + 2]);
            }
        }

        // top loop flange
        difference() {
            // flange
            translate([hole_height + 3 + 0.5, 0, 0]) {
                cube([7, 3, hole_height + 2]);
            }
            // hole in flange
            translate([hole_height + 3 + 0.5, 0, 4]) {
                cube([4, 3, hole_height + 2 - 8]);
            }
        }
    }
}
