thickness = 2.4; // mm
height = 8;
outer_hole_diameter = 10; //mm
inner_hole_diameter = 4.65; //mm
length = outer_hole_diameter + 2 * thickness + inner_hole_diameter;
$fn=24;

difference() {
  linear_extrude(thickness + height) {
    difference() {
      hull() {
        translate([0, length / 2]) {
          circle(d = outer_hole_diameter + 2 * thickness);
        }
        translate([0, length / -2]) {
          circle(d = outer_hole_diameter + 2 * thickness);
        }
      }

      translate([0, length / 2]) {
        circle(d = outer_hole_diameter);
      }
      translate([0, length / -2]) {
        circle(d = outer_hole_diameter);
      }
      circle(d = inner_hole_diameter);
    }
  }
  translate([0, 0, height / 2 + thickness]) {
    cube([outer_hole_diameter + 2 * thickness + 0.01,
          inner_hole_diameter + outer_hole_diameter,
          height + 0.01],
         true);
  }
  translate([0, 0, height / 2 + thickness]) {
    cube([outer_hole_diameter,
      inner_hole_diameter + 2 * outer_hole_diameter + 4 * thickness,
        height + 0.01],
       true);
  }
  translate([0,
             inner_hole_diameter / 2 + thickness + outer_hole_diameter,
             height / 2 + thickness]) {
    cube([outer_hole_diameter + 2 * thickness + 0.01,
          2 * thickness + 0.01,
          height + 0.01],
         true);
  }

  translate([0,
             -1 * (inner_hole_diameter / 2 + thickness + outer_hole_diameter),
             height / 2 + thickness]) {
    cube([outer_hole_diameter + 2 * thickness + 0.01,
          2 * thickness + 0.01,
          height + 0.01],
         true);
  }
}
