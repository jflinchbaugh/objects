inner_width = 1.5 * 25.4; //mm
height = 1.75 * 25.4; //mm
top_wall_thickness = 4; //mm
bottom_wall_thickness = 5; //mm
floor_thickness = 2;//mm
tolerance = 0.2; //mm
hole_width=4;//mm
$fn=36;

difference() {
  hull() {
    translate([0,0,height / -2 - floor_thickness])
      minkowski() {
        cube([
          inner_width + tolerance,
          inner_width + tolerance,
          0.01],
         center = true);
        cylinder(d = 2 * bottom_wall_thickness, h=0.01);
    }
    cylinder(
      d = top_wall_thickness * 2 + inner_width + tolerance,
      h = height + floor_thickness,
      center = true
    );
  }

  // dowel hole
  translate([0, 0, floor_thickness]) {
    cylinder(
      d = inner_width + tolerance,
      h = height + 2 * floor_thickness + 0.02,
      center = true
    );
  }
  // screw hole
  cylinder(
           d = hole_width,
           h = height + floor_thickness * 3,
           center = true
           );
}
