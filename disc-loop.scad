thickness = 7; //mm
hole_diameter = 0.25 * 25.4; //mm
inside_width = 200; //mm
inside_height = 20; //mm
inside_height_larger = 30; //mm
radius=3;

$fn=60;

linear_extrude(thickness) {
  difference() {
    minkowski() {
      square(
        [2 * thickness + inside_width - 2 * radius,
         4 * thickness + inside_height + inside_height_larger - 2 * radius],
        center=true);
      circle(r=radius);
    }
    translate([0, thickness + inside_height/2]) {
      square([inside_width, inside_height_larger], center = true);
    }
    translate([0, thickness - (4 * thickness + inside_height_larger)/2]) {
      square([inside_width, inside_height], center = true);
    }
    translate([0,
               ((thickness + (inside_height-inside_height_larger)/2) + (thickness - (4 * thickness + inside_height_larger-inside_height)/2)) / 2]) {
      circle(d=hole_diameter);
    }
  }
}
