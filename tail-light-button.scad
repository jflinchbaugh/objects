light_thickness = 16.5; //mm
light_height = 19.2; //mm
strap_thickness = 2; //mm
strap_width = 7; //mm
button_depth= 3.1; //mm

$fn=60;

difference() {
  cube([light_thickness + 2 * strap_thickness, light_height + 2 * strap_thickness, strap_width], center=true);

  cube([light_thickness, light_height, strap_width + 0.1], center=true);
}

translate([light_thickness/2, 0, 0]) {
  rotate([0,90,0]) {
    cylinder(d=strap_width, h=button_depth * 2, center=true);
  }
}

translate([light_thickness/2 + strap_thickness, 0, 0]) {
  rotate([0,90,0]) {
    cylinder(d=strap_width, h=button_depth * 2, center=true);
  }
}
