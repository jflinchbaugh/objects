// dock adapter to hold charging cable on 
// phone mount.

// parameters
plug_width = 11; // mm
plug_depth = 7; // mm

below_plug = 2; // mm
cable_width = 6; // mm
plug_back_depth = 4; // mm

peg_width = 7.5; // mm
peg_height = 8; // mm
peg_distance = 38.75; // mm between pegs

around_peg = 4;

main_width = around_peg * 2 + peg_width * 2 + peg_distance;
main_depth = plug_depth + plug_back_depth * 2;
main_height = peg_height + around_peg * 2;

difference() {
    // main body
    cube([
        main_width, 
        main_depth, 
        main_height
    ]);
    
    // cable slot
    translate([
        (main_width - cable_width) / 2,
        0, 
        0
    ]) {
        cube([
            cable_width,
            main_depth - plug_back_depth,
            main_height
        ]);
    }
    
    // plug slot
    translate([
        (main_width - plug_width) / 2,
        plug_back_depth, 
        below_plug
    ]) {
        cube([
            plug_width,
            plug_depth,
            main_height - below_plug
        ]);
    }
    
    // left peg
    translate([
        around_peg,
        0, 
        around_peg
    ]) {
        cube([
            peg_width,
            main_depth,
            peg_height
        ]);
    }
    
        
    // right peg
    translate([
        main_width - peg_width - around_peg,
        0, 
        around_peg
    ]) {
        cube([
            peg_width,
            main_depth,
            peg_height
        ]);
    }
}