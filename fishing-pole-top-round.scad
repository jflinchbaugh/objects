thickness = 2.4; // mm
height = 8;
outer_diameter = 19; //mm
inner_hole_diameter = 4.65; //mm
outer_hole_diameter_w = 2 * inner_hole_diameter;
outer_hole_diameter_n = inner_hole_diameter + thickness / 4;
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
