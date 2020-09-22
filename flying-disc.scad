$fn=60;

difference() {
  cylinder(r1=50, r2=55, h=10, center=true);

  translate([0, 0, 0.6]) {
    cylinder(r1=45, r2=50, h=10, center=true);
  }
}
