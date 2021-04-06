length = 42;
cradle_side_thickness = 4.8;
cradle_thickness = 33;
height = 52;
cradle_radius = 24;
strap_width = 25;
side_wall_height = 11;
tooth_size=5;
tooth_step_angle=21;

test_cradle=false;

$fn = 48;

difference() {
  union() {
    if (! test_cradle) {
      strap_ring();
      cube([
            length,
            cradle_thickness + 2 * cradle_side_thickness,
            height],
          true);
      translate([0, 0, height / 4]) {
        cube([
              length + 2 * cradle_side_thickness,
                cradle_thickness + 2 * cradle_side_thickness,
                height/2],
            true);
      }
    }
    translate([
                0,
                0,
                height / -2 + sqrt(cradle_radius * cradle_radius - (length * length / 4))
                ]) {
      intersection() {
        cube([
               length,
               cradle_thickness,
               2 * cradle_radius],
             true);
        rotate([
                90,
                0,
                0]) {
          cylinder(
            r = cradle_radius,
            h = cradle_thickness + 2 * cradle_side_thickness,
            center = true);
        }
      }
    }

    translate([
              0,
              0,
              height / -2
              + sqrt(cradle_radius * cradle_radius - (length * length / 4))]) {
      for(a = [-2 * tooth_step_angle : tooth_step_angle : 2 * tooth_step_angle]) { 
        rotate([0,a,0]) {
          translate([0,0,-cradle_radius + 0.3]) {
            rotate([0,45,0]) {
              cube([tooth_size, cradle_thickness, tooth_size], true);
            }
          }
        }
      }
    }

    if (! test_cradle) {
      translate([
                0,
                0,
                0 - side_wall_height - cradle_radius
                + sqrt(cradle_radius * cradle_radius - (length * length / 4))]) {
        difference() {
          cube([
                length,
                cradle_thickness + 2 * cradle_side_thickness,
                height],
              true);
          cube([
                length + 0.1,
                cradle_thickness,
                height + 0.1],
              true);
        }
      }
    }
  }

  if (! test_cradle) {
    translate([
              0,
              0,
              height / 2 + cradle_radius
              - sqrt(cradle_radius * cradle_radius - (length * length / 4))]) {
      rotate([
              90,
              0,
              0]) {
        cylinder(
          r = cradle_radius,
          h = cradle_thickness + 2 * cradle_side_thickness + 0.1,
          center = true);
      }
    }
  }
}

module strap_ring() {
  translate([0, 0, height / 2 - cradle_side_thickness]) {
    difference() {
      cube([
            length + 6 * cradle_side_thickness,
            cradle_thickness + 2 * cradle_side_thickness,
            2 * cradle_side_thickness],
          true);
      translate([(length + 3 * cradle_side_thickness) / 2, 0, 0]) {
        cube([
              cradle_side_thickness,
              strap_width,
              2 * cradle_side_thickness + 0.1],
            true);
      }
      translate([(length + 3 * cradle_side_thickness) / - 2, 0, 0]) {
        cube([
              cradle_side_thickness * 4,
              strap_width + 2 * cradle_side_thickness,
              2 * cradle_side_thickness + 0.1],
            true);
      }
    }
  }
}
