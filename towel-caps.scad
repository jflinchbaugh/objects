thickness = 20; //mm
inside_diameter = 40; //mm
ring_diameter = inside_diameter + 15; //mm
ring_thickness = 2; //mm
screw_diameter = 4.8; //mm
wall_thickness = ring_thickness; //mm

$fn=32;


difference() {
  union() {
    cylinder(d=inside_diameter, h=thickness / 2);
    translate([0,0,thickness / 2]) {
      cylinder(d=ring_diameter, h=ring_thickness);
      translate([0,0,ring_thickness]) {
        cylinder(d1=ring_diameter, d2=inside_diameter / 2, h=thickness / 2 - ring_thickness);
      }
    }
  }
  translate([0, 0, -0.01]) {
    cylinder(d=screw_diameter, h=thickness + 0.02);
    cylinder(d=inside_diameter- 2 * wall_thickness, h=thickness / 2);
  }
}
