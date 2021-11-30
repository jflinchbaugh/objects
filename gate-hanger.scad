thickness = 3; // mm
width = 15; //mm
height = 30; //mm
radius = 1; //mm
hole_diameter=2; //mm
$fn=60;

plate(width + 2 * thickness, height, radius, thickness);

trough(15, 20, 30, thickness);

module plate(w, h, radius, t) {
  linear_extrude(t, center=true) {
    difference() {
      minkowski() {
        square([w - 2 * radius, h - 2 * radius], center=true);
        circle(r=radius);
      }

      translate([w / 2 - 2 * hole_diameter, h / -2 + 2 * hole_diameter]) {
        circle(d=hole_diameter);
      }

      translate([w / -2 + 2 * hole_diameter, h / -2 + 2 * hole_diameter]) {
        circle(d=hole_diameter);
      }
      translate([0, h / 2 - 2 * hole_diameter]) {
        circle(d=hole_diameter);
      }
    }
  }
}

module trough(iw, ih, l, thickness) {
  linear_extrude(l) {
    difference() {
      union() {
        circle(d=iw + 2 * thickness);
        translate([0, (iw-thickness)/2]) {
          square([iw + 2 * thickness, ih - iw / 2], center=true);
        }
      }
      union() {
        circle(d=iw);
        translate([0, (iw-thickness)/2]) {
          square([iw, ih - iw / 2], center=true);
        }
      }
    }
  }
}
