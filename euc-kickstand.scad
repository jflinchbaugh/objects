width = 70; //mm
length = 70; //mm
thickness = 3; //mm
radius = 2; //mm
hole_offset = 6; //mm
hole_distance = 23.8; //mm
hole_diameter = 3.2; //mm
cut_out_width = 50; //mm
tooth_depth = 6; //mm
feet_depth = 30; //mm
feet_length = 20; //mm

$fn = 24;

difference() {
  linear_extrude(thickness + tooth_depth + feet_depth) {
    difference() {
      minkowski() {
        square([width - 2 * radius, length - 2 * radius], center = true);
        circle(radius);
      }
      translate([0, length / 2 - hole_offset]) {
        translate([hole_distance / 2, 0]) {
          circle(d = hole_diameter);
        }
        translate([hole_distance / -2, 0]) {
          circle(d = hole_diameter);
        }
      }
    }
  }
  translate([0, 0, -0.01]) {
    linear_extrude(tooth_depth) {
      square([cut_out_width, length + 0.01], center = true);
    }
  }
  translate([0, 0, tooth_depth + thickness + 0.01]) {
    linear_extrude(feet_depth) {
      square([cut_out_width, length + 0.01], center = true);
    }
  }
  translate([0, -feet_length, tooth_depth + thickness + 0.01]) {
    linear_extrude(feet_depth) {
      square([width + 0.01, length - feet_length + 0.01], center = true);
    }
  }
}
