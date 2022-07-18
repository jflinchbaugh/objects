bar_diameter=31.5; //mm
height=15; //mm
width=20; //mm
$fn=36;

linear_extrude(width) {
  difference() {
    union() {
      square([bar_diameter, height], true);
      translate([0, height / 2]) {
        circle(d=bar_diameter);
      }
    }
    translate([0, height / -2]) {
      circle(d=bar_diameter);
    }
    translate([0, height / -1.5]) {
      square([bar_diameter, height], true);
    }
  }
}
