inner_diameter = 12.9;
thickness = 1.4;
height = 3.75;
inside_slots=0.6;
knurl_step=10;

$fn=36;

difference() {
  cylinder(d=inner_diameter + 2 * thickness, h = height + thickness);
  translate([0, 0, -0.01]) {
    cylinder(d=inner_diameter, h = height);
  }

  translate([0,0,0.25*height]) {
    for(i=[0:knurl_step:360]) {
      rotate([0, 0, i]) {
        translate([0, inner_diameter/2 + thickness, 0]) {
          cylinder(d=thickness/2, h=height+thickness);
        }
      }
    }
  }

  translate([0,0,-0.1]) {
    for(i=[knurl_step/2:180:360]) {
      rotate([0, 0, i]) {
        translate([0, inner_diameter/2, 0]) {
          cylinder(r=inside_slots, h=height+0.1);
        }
      }
    }
  }
}
