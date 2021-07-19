// dock adapter to hold charging cable on 
// phone mount.

// parameters
plug_width = 10.74; // mm
plug_depth = 5.54; // mm

below_plug = 2; // mm
cable_width = 7.2; // mm
plug_back_depth = 3; // mm

peg_width = 13.0; // mm
peg_height = 7.0; // mm
peg_distance = 15.0; // mm between inside of pegs
peg_angle = 12; // degrees

extra_height = 1; // mm
around_peg = 4; // mm
rounding = 2; // mm

main_width = around_peg * 2 + peg_width * 2 + peg_distance;
main_depth = plug_depth + plug_back_depth * 2;
main_height = peg_height + around_peg * 2 + extra_height;


difference() {
    // main body
    translate([rounding, rounding, rounding]) {
        minkowski() {
            cube([
                main_width - rounding * 2,
                main_depth - rounding * 2,
                main_height - rounding *2
            ]);
            sphere(rounding);
        }
    }

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
        -0.5 * main_depth,
        main_height - around_peg - peg_height
    ]) {
      rotate([-peg_angle, 0, 0]) {
        cube([
            peg_width,
            main_depth * 2,
            peg_height
        ]);
      }
    }


    // right peg
    translate([
        main_width - peg_width - around_peg,
        -0.5 * main_depth,
        main_height - around_peg - peg_height
    ]) {
        rotate([-peg_angle, 0, 0]) {
          cube([
              peg_width,
              main_depth * 2,
              peg_height
          ]);
        }
    }
}
