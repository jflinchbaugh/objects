brush_diameter = 20; //mm
comb_height = 20; //mm
side_thickness = 3; // mm
tooth_thickness = 0.8;

$fn=48;

difference() {
  union() {
    // whole comb
    cylinder(
      d1=brush_diameter + 2 * side_thickness,
      d2=brush_diameter + 2 * tooth_thickness,
      h=comb_height
    );
    // handle of comb
    cylinder(d=brush_diameter + 2 * side_thickness, h=comb_height / 2);
  }

  // cut out middle
  translate([0, 0, -0.1]) {
    cylinder(
      d1=brush_diameter + 2 * tooth_thickness,
      d2=brush_diameter,
      h=comb_height + 0.2
    );
  }

  // cut out teeth
  translate([0, 0, comb_height / 2]) {
    for(a=[0:teeth_angle(brush_diameter):360]) {
      rotate([0, -90, a]) {
        linear_extrude(brush_diameter) {
          polygon([[0,0], [comb_height / 2 + 0.1, 1], [comb_height / 2 + 0.1, -1]]);
        }
      }
    }
  }
}

function teeth_angle(diameter) = 360 / (floor(360 / (280 / diameter)));
