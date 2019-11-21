hole_diam = 22.5; // mm
height = 40; // mm
sides = 3.0; // mm
thickness = 20; //mm
bottom_offset = 4; // mm

difference() {
  cube([height, hole_diam + 2 * sides, thickness]);
  translate([hole_diam / 2 + bottom_offset, hole_diam / 2 + sides, -0.1]) {
    cylinder(d=hole_diam, h=thickness + 0.2);
  }
  translate([-0.1, hole_diam / 2 + sides, 0]) {
    cube([hole_diam - sides, hole_diam - sides, 2 * thickness + 0.2], true);
  }

  translate([height, hole_diam / 2 + sides, 0]) {
    cube([2 * (height - hole_diam - bottom_offset - sides),
          hole_diam - sides,
          2 * thickness + 0.2],
         true);
  }
}
