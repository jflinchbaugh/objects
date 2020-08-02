thickness = 4; //mm
strap_width = 25; //mm
length = thickness * 5;
tolerance=0.2; //mm
screw_diameter = 2; //mm
screw_head_depth = 1.5; //mm
screw_head_diameter = 5; //mm
$fn=48;

loop=true;
hook=true;

if (loop) {
  difference() {
    hull() {
      cylinder(d=strap_width + 2 * thickness, h=thickness);
      translate([0, 3 * thickness, 0]) {
        cylinder(d=strap_width + 2 * thickness, h=thickness);
      }
      translate([0, 7 * thickness, 0]) {
        cylinder(d=4 * thickness, h=thickness);
      }
    }

    translate([strap_width / -2, -1 * thickness, -0.1]) {
      cube([strap_width, thickness, thickness + 0.2]);
    }
    translate([strap_width / -2, thickness, -0.1]) {
      cube([strap_width, thickness, thickness + 0.2]);
    }

    translate([0, 4 * thickness, -0.1]) {
      cylinder(d=3 * thickness, h=thickness + 0.2);
    }

    hull() {
      translate([0, 4 * thickness, -0.1]) {
        cylinder(d=2 * thickness, h=thickness + 0.2);
      }
      translate([0, 7 * thickness, -0.1]) {
        cylinder(d=2 * thickness, h=thickness + 0.2);
      }
    }

    hull() {
      translate([0, 4 * thickness, thickness / 2]) {
        cylinder(d=3 * thickness, h=thickness + 0.2);
      }
      translate([0, 7 * thickness, thickness / 2]) {
        cylinder(d=3 * thickness, h=thickness + 0.3);
      }
    }
  }
}

if (hook) {
  translate([strap_width * 2, 0, 0]) {
    difference() {
      union() {
        hull() {
          translate([strap_width / -2 - thickness, -3 * thickness, 0]) {
            minkowski() {
              cube([strap_width + 2 * thickness, thickness * 4, thickness / 2]);
              cylinder(d=2 * thickness, h=thickness / 2);
            }
          }
          translate([0, 4 * thickness, 0]) {
            cylinder(d=4 * thickness, h=thickness);
          }
        }

        //peg/hook
        union() {
          translate([0, 4 * thickness, 0]) {
            cylinder(d=2 * thickness - 2 * tolerance, h=2 * thickness);
          }
          translate([0, 4 * thickness, 2 * thickness]) {
            cylinder(
              d1=2 * thickness - 2 * tolerance,
              d2=3 * thickness - 2 * tolerance,
              h=thickness / 2);
          }
          translate([0, 4 * thickness, 2.5 * thickness]) {
            cylinder(d=3 * thickness - 2 * tolerance, h=thickness/2);
          }
        }
      }

      // screw hole
      translate([0, 4 * thickness, -0.1]) {
        cylinder(d=screw_diameter, h=3 * thickness + 0.2);
      }
      translate([0, 4 * thickness, 3 * thickness - screw_head_depth]) {
        cylinder(d=screw_head_diameter, h=thickness + 0.1);
      }

      // slot
      translate([strap_width / -2, -2 * thickness, -0.1]) {
        cube([strap_width, 2 * thickness, thickness + 0.2]);
      }

      translate([thickness / -2, -4 * thickness - 0.1, -0.1]) {
        cube([thickness, 2 * thickness + 0.2, thickness + 0.2]);
      }
    }
  }
}
