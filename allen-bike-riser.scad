length = 42;
cradle_side_thickness = 5;
cradle_thickness = 40;
height = 50;
cradle_radius = 25;
strap_width = 25;

$fn = 48;

difference() {
  union() {
    difference() {
      cube([
            length + 6 * cradle_side_thickness,
            cradle_thickness,
            cradle_side_thickness],
          true);
      translate([(length + 3 * cradle_side_thickness) / 2, 0, 0]) {
        cube([
              cradle_side_thickness,
              strap_width,
              cradle_side_thickness + 0.1],
            true);
      }
      translate([(length + 3 * cradle_side_thickness) / - 2, 0, 0]) {
        cube([
                cradle_side_thickness,
                strap_width,
                cradle_side_thickness + 0.1],
              true);
      }
    }
    cube([
           length,
           cradle_thickness,
           height],
         true);
    translate([0, 0, height / 4]) {
      cube([
             length + 2 * cradle_side_thickness,
              cradle_thickness,
              height/2],
           true);
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
  }
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
