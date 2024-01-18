wire_diameter = 2.05; //mm
separation = 20; //mm
height = 10; //mm
thickness = 1.2; //mm
$fn=24;

opening=0.8*wire_diameter;

difference() {
  union() {
    translate([-0.5 * separation, 0, 0]) {
      difference() {
        cylinder(d=2*thickness+wire_diameter,h = height, center = true);
        cylinder(d=wire_diameter,h = height + 0.1, center = true);
      }
    }
    translate([0.5 * separation, 0, 0]) {
      difference() {
        cylinder(d=2*thickness+wire_diameter,h = height, center = true);
        cylinder(d=wire_diameter,h = height + 0.1, center = true);
      }
    }
    translate([0,(wire_diameter+thickness)/2,0]) {
      cube([separation, thickness, height], center = true);
    }
  }
  translate([0,(wire_diameter-opening)/2,0]) {
    cube([separation, opening, height+0.1], center = true);
  }
}
