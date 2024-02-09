wire_diameter = 2.3; //mm
height = 5; //mm
thickness = 1.2; //mm
hook_length = 6; //mm
$fn=24;

opening=0.75*wire_diameter;

union() {
  // clip
  difference() {
    cylinder(d=2*thickness+wire_diameter,h = height, center = true);
    cylinder(d=wire_diameter,h = height + 0.1, center = true);
    translate([(wire_diameter + thickness)/2,0,0]) {
      cube([thickness+wire_diameter/2, opening, height+0.1], center = true);
    }
  }
  // hook
  translate([-((wire_diameter+thickness)/2 + hook_length/2),0,0]) {
    difference() {
      cube([hook_length, thickness*2, height], center = true);
      translate([thickness,0,thickness*2]) {
        cube([hook_length-2*thickness+0.01, 2*thickness+0.01, height+0.01], center = true);
      }
    }
  }
}
