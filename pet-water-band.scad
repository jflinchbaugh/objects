length = 70; //mm
width = 5; //mm
extra = 2; //mm
thickness = 1; //mm
$fn=24;

difference() {
  hull() {
    cylinder(d=width + 2 * extra, h=thickness, center = true);
    translate([length, 0, 0]) {
      cylinder(d=width + 2 * extra, h=thickness, center = true);
    }
  }
  cylinder(d=width, h=thickness + 0.1, center = true);
  translate([length, 0, 0]) {
    cylinder(d=width, h=thickness + 0.1, center = true);
  }
}
