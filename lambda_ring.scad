thickness = 0.9; // mm
diameter = 21.0; // mm
height = 11; // mm
$fn=60;

difference() {
  cylinder(d=diameter + 2 * thickness, h=height);
  translate([0,0,-0.1]) {
    cylinder(d=diameter, h=height + 0.2);
  }
  translate([0, 0, 2.5]) {
    rotate([90, 0, 0]) {
      linear_extrude(diameter) {
        text(text = "(\u03BB)", size = (height - 3), halign="center", font = "FreeMono:style=Bold");
      }
    }
  }
}
