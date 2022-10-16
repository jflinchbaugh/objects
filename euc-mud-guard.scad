width = 50; //mm
length = 90; //mm
thickness = 2; //mm
radius = 2; //mm
hole_offset = 6; //mm
hole_distance = 23.8; //mm
hole_diameter = 3.0; //mm
cut_out = 60; //mm

$fn = 24;

linear_extrude(thickness) {
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
