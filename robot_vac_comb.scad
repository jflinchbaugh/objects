brush_diameter = 15; //mm
comb_height = 20; //mm
side_thickness = 3; // mm
tooth_thickness = 1.2;
spacing_constant=450;
band_height = 3.2; //mm
band_thickness = 3.2; //mm

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
    cylinder(d=brush_diameter + 2 * band_thickness, h = band_height);
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
  translate([0, 0, comb_height / 2 + 0.1]) {
    for(a=[0:teeth_angle(brush_diameter):360]) {
      rotate([0, -90, a]) {
        linear_extrude(brush_diameter) {
          polygon([[0,1], [comb_height / 2 + 0.1, 1.5], [comb_height / 2 + 0.1, -1.5], [0,-1]]);
        }
      }
    }
  }

  // cut out the expansion slit
  translate([0, 0, -0.1]) {
    rotate([0, -90, 0]) {
      linear_extrude(brush_diameter) {
        polygon([[0,1], [comb_height + 0.2, 1], [comb_height + 0.2, -1], [0,-1]]);
      }
    }
  }
}

function teeth_angle(diameter) = 360 / floor(360 / (spacing_constant / diameter));
