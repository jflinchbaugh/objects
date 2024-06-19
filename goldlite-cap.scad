diameter=19.60;
height=13;
thickness=1.2;
$fn=24;

cylinder(d=diameter+2*thickness, h=2*thickness);
difference() {
  cylinder(d=diameter,h=height);
  translate([0,0,0.01]) {
    cylinder(d=diameter-2*thickness,h=height);
  }
}
