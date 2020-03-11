length = 90;
width = 67;
thickness = 6;
wall = 2;
ring_dist = 40;
ring_edge = 9;
ring_thickness = 2.4;
round = 1;
$fn = 24;

difference() {
  minkowski() {
    cube([width + 2 * wall, length, thickness], true);
    sphere(1);
  }
  translate([0, -1 * wall, wall]) {
    cube([width, length, thickness], true);
  }

  translate([ring_dist / -2, length / 2 - ring_edge - wall, 0]) {
    cylinder(h = thickness + 2 * round, d = ring_thickness,center = true);
  }

  translate([ring_dist / 2, length / 2 - ring_edge - wall, 0]) {
    cylinder(h = thickness + 2 + round, d = ring_thickness, center=true);
  }

}
