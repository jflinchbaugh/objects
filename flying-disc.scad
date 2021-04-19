r=25;
ring_thickness=4;
h=9;
rounding=2;
middle_thickness=0.6;

$fn=60;

difference() {
  minkowski() {
    cylinder(r=r-rounding, h=h-2*rounding, center=true);
    sphere(r=rounding, $fn=8);
  }

  translate([0, 0, rounding + middle_thickness]) {
    minkowski() {
      cylinder(r=r-ring_thickness-rounding, h=h, center=true);
      sphere(r=rounding, $fn=8);
    }
  }
}
