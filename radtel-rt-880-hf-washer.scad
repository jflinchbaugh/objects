outer_diameter = 11; //mm
inner_diameter = 7.5; //mm
height = 6.5;//mm
$fn=24;

difference() {
  cylinder(h=height, d=outer_diameter);
  cylinder(h=height+0.01, d=inner_diameter);
}
