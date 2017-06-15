// a friction-based badge holder made of of a TPU core and a PLA shell

// parameters
// ----------

thickness = 8; // mm, thickness of TPU core
height = thickness * 2; // mm, height of TPU core
width = height * 1.5; // mm, width of TPU core
slot = 0.85; // mm, thickness of card slot in TPU core
tooth_slot_scaling = 0.4; // multiplier, scale teeth to be tighter than slot
part_tolerance = 0.1; // mm, tolerance gap allowed by shell around core
flange_hole = 5; // mm, space inside flange loop

// choose which pieces to render, since they are different materials
inside = true;
shell = true;

// ----------

// calculations for gap between teeth based on stack of right triangles
tooth_height = (thickness - 2)/2;
tooth_step = tooth_height - (slot * tooth_slot_scaling)/2;

if (inside) {
    translate([1, 0, 0]) {
        linear_extrude(width) {
            difference() {
                square([height, thickness]);
                // top slot
                translate([height - 1 - tooth_height, (thickness - (slot + 0.1)) / 2]) {
                    square([tooth_height, slot + 0.1]);
                }
                // teeth
                for (i = [tooth_height:tooth_step:height-1]) {
                    polygon([[i, thickness/2], [i-tooth_height, 1], [i-tooth_height,thickness-1]]);
                }
            }
        }
    }
}

if (shell) {
    hole_thickness = thickness + part_tolerance * 2;
    hole_height = height + part_tolerance * 2;
    hole_width = width + part_tolerance * 2;

    translate([0, thickness * 2, 0]) {
        // shell
        difference() {
            // main shell
            cube([hole_height + 3, hole_thickness + 4, hole_width + 2]);
            // cut out big hole
            translate([1,2,1]) {
                cube([hole_height, hole_thickness, hole_width + 1]);
            }
            // cut out card slot
            translate([0, (hole_thickness + 4 - slot * 2) / 2, 0]) {
                cube([hole_height, slot * 2, hole_width + 2]);
            }
        }

        // top loop flange
        difference() {
            // flange
            translate([hole_height + 3, 0, 0]) {
                cube([3 + flange_hole, 3, hole_width + 2]);
            }
            // hole in flange
            translate([hole_height + 3, 0, 4]) {
                cube([flange_hole, 3, hole_width + 2 - 8]);
            }
        }
    }
}
