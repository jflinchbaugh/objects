// a friction-based badge holder made of of a TPU core and a PLA shell

// parameters
// ----------

thickness = 6; // mm, thickness of TPU core
height = 12; // mm, height of TPU core
width = 12; // mm, width of TPU core
slot = 0.85; // mm, thickness of card slot in TPU core
tooth_slot_scaling = 0.3; // multiplier, scale teeth to be tighter than slot
tooth_depth = 1.5; // mm, depth of saw teeth, leaving room in core sides
part_tolerance = 0.0; // mm, tolerance gap allowed by shell around core
hole_extra_height = 0.2; // mm, extra height for hole in shell
shell_thickness = 3; // mm, thickness of shell around insert

flange_hole = 5; // mm, space inside flange loop
flange_thickness = 3; // mm, thickness of solid parts of flange

// choose which pieces to render, since they are different materials
inside = true;
shell = false;

// ----------

// calculations for gap between teeth based on stack of right triangles
tooth_height = (thickness - 2)/2;
tooth_step = tooth_height - (slot * tooth_slot_scaling)/2;

if (inside) {
    translate([1, 0, 0]) {
        difference() {
            linear_extrude(width) {
                difference() {
                    // main body
                    square([height, thickness]);
                    // top slot
                    translate([height - 1 - tooth_height, (thickness - (slot + 0.1)) / 2]) {
                        square([tooth_height, slot + 0.1]);
                    }
                    // teeth
                    for (i = [tooth_height:tooth_step:height-1]) {
                        polygon([[i, thickness/2], [i-tooth_height, 1.5], [i-tooth_height,thickness-1.5]]);
                    }
                }
            }
        }
    }
}

if (shell) {
    hole_thickness = thickness + part_tolerance * 2;
    hole_height = height + part_tolerance * 2 + hole_extra_height;
    hole_width = width + part_tolerance * 2;

    translate([0, thickness * 2, 0]) {
        // shell
        difference() {
            // main shell
            cube([hole_height + shell_thickness + 1, hole_thickness + shell_thickness * 2, hole_width + 2]);
            // cut out big hole
            translate([1,shell_thickness,1]) {
                cube([hole_height, hole_thickness, hole_width + 1]);
            }
            // cut out card slot
            translate([0, (hole_thickness + shell_thickness * 2 - slot * 2) / 2, 0]) {
                cube([hole_height, slot * 2, hole_width + shell_thickness]);
            }
        }

        // top loop flange
        difference() {
            // flange
            translate([hole_height + shell_thickness + 1, 0, 0]) {
                cube([flange_thickness + flange_hole, flange_thickness, hole_width + 2]);
            }
            // hole in flange
            translate([hole_height + shell_thickness + 1, 0, flange_thickness]) {
                cube([flange_hole, flange_thickness, hole_width + 2 - flange_thickness * 2]);
            }
        }
    }
}
