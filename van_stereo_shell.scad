thickness = 2.8; //mm
width = 184; //mm
depth = 65; //mm
height = 103; //mm
lip = thickness; //mm
$fn=24;

difference() {
  minkowski() {
    cube([width, height - 2 * thickness, depth - 2 * thickness], center = true);
    cylinder(r=thickness,h=thickness);
  }
  translate([0,thickness,0]) {
    cube([width-2*lip, height+0.1, depth + 0.01], center = true);
  }
  translate([0,thickness,lip*2]) {
    cube([width, height, depth], center = true);
  }
}
