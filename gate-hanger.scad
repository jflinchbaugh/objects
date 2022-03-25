post_diameter = 15; //mm
trough_height = 20; //mm
trough_length = 20; //mm
thickness = 3; // mm
plate_height = 35; //mm
radius = 2; //mm
hole_diameter = 3; //mm
angle = 0; //degrees

width = post_diameter + 4 * thickness;
$fn=60;

union() {
  plate(width, plate_height, radius, thickness);
  trough(post_diameter, trough_height, trough_length, thickness, angle);
}

module plate(w, h, radius, t) {
  linear_extrude(t, center=true) {
    difference() {
      minkowski() {
        square([w - 2 * radius, h - 2 * radius], center=true);
        circle(r=radius);
      }

      translate([w / 2 - 1.5 * hole_diameter, h / -2 + 1.5 * hole_diameter]) {
        circle(d=hole_diameter);
      }

      translate([w / -2 + 1.5 * hole_diameter, h / -2 + 1.5 * hole_diameter]) {
        circle(d=hole_diameter);
      }
      translate([0, h / 2 - 1.5 * hole_diameter]) {
        circle(d=hole_diameter);
      }
    }
  }
}

module trough(iw, ih, l, thickness, angle) {
  difference() {
    rotate([0, angle, 0]) {
      translate([0, 0, -l]) {
        linear_extrude(2 * l) {
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
    }
    // cut off the bottom half
    translate([0, 0, -l/2 - thickness]) {
      cube([iw + ih + l, iw + ih + l, l + 2 * thickness], center=true);
    }
  }
}
