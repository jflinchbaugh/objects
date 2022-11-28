thickness = 1/8 * 25.6; //mm
width = 16; //mm
height = 10; //mm
hole_diameter = 4.7; //mm
hole_offset = 2.61; //mm
$fn=24;

linear_extrude(thickness) {
  difference() {
    square([width, height], center = true);
    translate([0, hole_offset]) {
      circle(d=hole_diameter);
    }
  }
}
