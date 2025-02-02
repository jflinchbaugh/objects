antenna_diameter = 10.5; // mm
antenna_depth = 15; // mm
antenna_angle = 45; // degrees
antenna_offset = 15; // mm
spike_diameter = 12; // mm
side_thickness = 5; // mm
radius = 2;

$fn=24;

difference() {
  minkowski() {
    hull() {
      translate([antenna_offset, 0, 0]) {
        rotate([0,antenna_angle,0]) {
          cylinder(d=antenna_diameter + side_thickness * 2 - 2 * radius,
                  h=antenna_depth-0.1 - 2 * radius,
                  center = true);
        }
      }

      translate([-1 * antenna_offset, 0, 0]) {
        rotate([0,-1 * antenna_angle,0]) {
          cylinder(d=antenna_diameter + side_thickness * 2 - 2 * radius,
                  h=antenna_depth -0.1 - 2 * radius,
                  center = true);
        }
      }

      translate([0, 0, -1 * (antenna_diameter + side_thickness + antenna_depth)]) {
        cylinder(
                d=antenna_diameter + side_thickness * 2,
                h=0.1,
                center = true);
      }
    }
    sphere(r=radius);
  }

  // holes
  union() {
    translate([antenna_offset, 0, 0]) {
      rotate([0,antenna_angle,0]) {
        cylinder(d=antenna_diameter, h=antenna_depth, center = true);
      }
    }

    translate([-1 * antenna_offset, 0, 0]) {
      rotate([0,-1 * antenna_angle,0]) {
        cylinder(d=antenna_diameter, h=antenna_depth, center = true);
      }
    }


    cylinder(d=spike_diameter, h=100, center = true);
  }
}
