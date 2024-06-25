thickness = 2.0; // mm
height = 8;
outer_diameter = 18; //mm
inner_hole_diameter = 4.55; //mm
outer_hole_diameter_n = (outer_diameter - inner_hole_diameter - 2 * thickness) / 2;
outer_hole_diameter_w = 2 * outer_hole_diameter_n;
$fn=24;

difference() {
  linear_extrude(thickness + height, true) {
    difference() {
      circle(d = outer_diameter);
      circle(d = inner_hole_diameter);

      translate([(outer_diameter + inner_hole_diameter) / 4,0,0]) {
        resize([outer_hole_diameter_n, outer_hole_diameter_w], true) {
          circle(d = inner_hole_diameter);
        }
      }

      translate([(outer_diameter + inner_hole_diameter) / -4,0,0]) {
        resize([outer_hole_diameter_n, outer_hole_diameter_w], true) {
          circle(d = inner_hole_diameter);
        }
      }
    }
  }

  translate([0,0,height/2 + thickness]) {
    cube([outer_diameter + 0.01, outer_diameter - 3 * thickness, height + 0.01], true);
  }
  rotate([0, 0, 45]) {
    translate([0,0,height/2 + thickness]) {
      cube([outer_diameter - 4 * thickness, outer_diameter + 0.01, height + 0.01], true);
      cube([outer_diameter + 0.01, outer_diameter - 4 * thickness, height + 0.01], true);
    }
  }
}
