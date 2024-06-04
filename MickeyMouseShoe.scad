width = 40;
height = width * 17/20;
thickness = 3;
lace_width = 10;
loop_thickness = 2;

linear_extrude(thickness) {
  resize([width, height]) {
    import(file = "MickeyMouse.svg", center=true);
  }
}

rotate([0, 0, 90]) {
  translate([0,0, thickness + loop_thickness/2]) {
    difference() {
      cube([2 * loop_thickness + lace_width, loop_thickness, 3 * loop_thickness],
          center = true);
      cube([lace_width, loop_thickness + 0.01, loop_thickness],
          center = true);
    }
  }
}
