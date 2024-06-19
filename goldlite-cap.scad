diameter=19.70;
height=15;
thickness=2.0;
$fn=24;

cylinder(d=diameter+2*thickness, h=2*thickness);
difference() {
  cylinder(d=diameter,h=height);
  translate([0,0,0.01]) {
    cylinder(d=diameter-2*thickness,h=height);
  }
}
