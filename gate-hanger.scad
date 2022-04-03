post_diameter = 15; //mm
trough_height = 20; //mm
trough_length = 45; //mm
shim = 24; //mm
thickness = 2; // mm
plate_height = 45; //mm
radius = 2; //mm
hole_diameter = 3; //mm

horiz_angle = 0; //degrees
vert_angle = 0; //degrees

width = post_diameter + 4 * thickness;
$fn = 64;

hanger(width, plate_height, radius, thickness,
       post_diameter, trough_height, trough_length,
       horiz_angle, vert_angle );

module hanger(width, plate_height, radius, thickness,
              post_diameter, trough_height, trough_length,
              horiz_angle, vert_angle) {
  union() {
    plate(width, plate_height, radius, thickness);
    trough(
          post_diameter,
          trough_height,
          trough_length,
          thickness,
          horiz_angle,
          vert_angle);
  }
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

module trough(iw, ih, l, thickness, h_angle, v_angle) {
  difference() {
    rotate([v_angle, h_angle, 0]) {
      union() {
        linear_extrude(2 * l, center=true) {
            difference() {
              union() {
                circle(d=iw + 2 * thickness);
                translate([0, (ih - iw / 2) / 2]) {
                  square([iw + 2 * thickness, ih - iw / 2], center=true);
                }
            }
            union() {
              circle(d=iw);
              translate([0, ih / 2]) {
                square([iw, ih], center=true);
              }
            }
          }
        }

        // insert shim
        linear_extrude(2 * shim, center=true) {
          difference() {
            union() {
              circle(d=iw + 2 * thickness);
              translate([0, (ih - iw / 2) / 2]) {
                square([iw + 2 * thickness, ih - iw / 2], center=true);
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
