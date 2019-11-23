use <pie_slice.scad>;

thickness = 0.8; // mm
diameter = 21.0; // mm
height = 8; // mm
gap_angle = 10; // degrees
inner_edge = thickness; // mm
text = "(\u03BB)";

$fn=60;

module outer_shell() {
  difference() {
    cylinder(d=diameter + 4 * thickness, h=height);
    translate([0,0,-0.1]) {
      cylinder(d=diameter + 2 * thickness, h=height + 0.2);
    }
    translate([0, 0, 2]) {
      rotate([90, 0, 0]) {
        linear_extrude(diameter) {
          text(
            text = text,
            size = (height - 2),
            halign="center",
            font = "FreeMono:style=Bold"
          );
        }
      }
    }
  }
}

// inner shell is enlarged by the gap_angle,
// but keeps the given diameter when compressed
module inner_shell() {
  ratio = gap_angle / 360 + 1;
  translate([0,0,-inner_edge]) {
    difference() {
      cylinder(d = diameter * ratio + 3 * thickness, h=height + 2 * inner_edge);
      translate([0,0,-0.1]) {
        cylinder(d = diameter * ratio, h=height + 2 * inner_edge + 0.2);
      }
      translate([0,0,inner_edge - 0.1]) {
        difference() {
          cylinder(d = diameter  * ratio + 4 * thickness, h=height + 0.2);
          translate([0,0,-0.1]) {
            cylinder(d = diameter  * ratio + 2 * thickness, h=height + 0.4);
          }
        }
      }
      // slot
      linear_extrude(height + 2 * inner_edge + 0.1) {
        slice(0, gap_angle, diameter);
      }
    }
  }
}

// render one shell at a time for multimaterial
outer_shell();

color("blue") {
  inner_shell();
}
