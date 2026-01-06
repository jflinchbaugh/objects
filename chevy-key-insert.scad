width = 6.30;
gap = 1.0;
thickness = 3.15;
length = 39;
top_width = 28.0;
inside_loop = 5;
$fn=24;


difference() {
  cube([length, width, thickness], center = true);
  cube([length, gap, thickness], center = true);
}
translate([-length / 2 - inside_loop/2, 0, 0]) {
  difference() {
    cylinder(h=thickness, d=inside_loop + 2 * thickness, center = true);
    cylinder(h=thickness+0.01, d=inside_loop, center = true);
  }
}
