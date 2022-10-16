width = 100; //mm
thickness = 6; //mm
hole_offset = 9; //mm
hole_distance = 23.8; //mm
hole_diameter = 3.2; //mm
hole_inset_diameter = 7; //mm
hole_inset_depth = 3; //mm
cut_out_width = 47; //mm
feet_length = 30; // 40; //mm
body_radius = 60; //mm

$fn = 36;

difference() {
  linear_extrude(feet_length) {
    difference() {
      square([width, body_radius], center = true);
      translate([0, body_radius - body_radius / 2 + thickness]) {
        circle(r = body_radius);
        square([cut_out_width, 2 * body_radius], center = true);
      }
    }
  }
  translate([0, -body_radius + body_radius / 2 - 0.01, hole_offset]) {
    translate([hole_distance / 2, 0, 0]) {
      rotate([-90, 0, 0]) {
        cylinder(d = hole_diameter, h = thickness + 0.02);
        cylinder(d = hole_inset_diameter, h = hole_inset_depth + 0.01);
      }
    }
    translate([hole_distance / -2, 0, 0]) {
      rotate([-90, 0, 0]) {
        cylinder(d = hole_diameter, h = thickness + 0.02);
        cylinder(d = hole_inset_diameter, h = hole_inset_depth + 0.01);
      }
    }
  }
}
