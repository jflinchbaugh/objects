width = 85; //mm
length = 50; //mm
thickness = 3; //mm
radius = 3; //mm
hole_offset = 9; //mm
hole_distance = 23.8; //mm
hole_diameter = 3.2; //mm
cut_out_width = 47; //mm
tooth_depth = 6; //mm
feet_depth = 10; //mm
feet_length = 40; //mm

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
  translate([0, -thickness/2, tooth_depth + thickness + 0.01]) {
    linear_extrude(feet_depth) {
      square([cut_out_width, length - thickness + 0.01], center = true);
    }
  }
  translate([0, feet_length / -2, tooth_depth + thickness + 0.01]) {
    linear_extrude(feet_depth) {
      square([width + 0.01, length - feet_length + 0.01], center = true);
    }
  }
  translate([0, feet_length / -2, 0]) {
    linear_extrude(tooth_depth) {
      square([width + 0.01, length - feet_length + 0.01], center = true);
    }
  }
}
