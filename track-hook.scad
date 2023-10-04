thickness = 2.5; //mm
depth = 3; //mm
latch_height = 10; //mm
hook_length = 6; // mm
bevel = 0.5;
$fn=48;

linear_extrude(thickness, center=true) {
  minkowski() {
    union() {
      translate([0, depth/1.2]) {
        square([depth - 2 * bevel, latch_height - 2 * bevel], center=true);
      }
      translate([depth,0]) {
        square([1.5 * depth - 2 * bevel, depth - 2 * bevel], center=true);
      }
      translate([depth * 1.5, (hook_length)/-2]) {
        square([depth - 2 * bevel, hook_length + depth - 2 * bevel], center=true);
      }

      translate([depth * 3.5, -1 * (hook_length - (hook_length - depth)/2)]) {
        square([depth - 2 * bevel, hook_length - 2 * bevel], center=true);
      }
    }
    circle(bevel);
  }
  translate([depth*2.5, -1 * (hook_length + depth / 2 - bevel)]) {
    difference() {
      circle(1.5 * depth);
      circle(0.5 * depth);
      translate([0, 1.5 * depth]) {
        square([3 * depth, 3 * depth], center = true);
      }
    }
  }
}
