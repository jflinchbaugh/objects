thickness = 2.5; //mm
depth = 3; //mm
inside_height = 10; //mm
hook_length = inside_height / 1.5;

linear_extrude(thickness, center=true) {
  translate([0, depth/2]) {
    square([depth, inside_height], center=true);
  }
  translate([depth,0]) {
    square([depth, depth], center=true);
  }
  translate([depth*1.5, (inside_height)/-2]) {
    square([depth, inside_height+depth], center=true);
  }
  translate([depth*2,(inside_height)/-1]) {
    square([depth*3, depth], center=true);
  }
  translate([depth * 3, -1 * (inside_height-(hook_length-depth)/2)]) {
    square([depth, hook_length], center=true);
  }
}
