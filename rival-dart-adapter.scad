ball_diameter = 23.25; //mm
dart_diameter = 12.25; //mm
total_length = 40; //mm
lip = 5; //mm
rounding = 1; //mm

$fn=60;

difference() {
  minkowski() {
    union() {
      cylinder(
        d2 = ball_diameter - 1 - 2 * rounding,
        d1 = ball_diameter + 1 - 2 * rounding,
        h = total_length - 2 * rounding,
        center = true);
      translate([0, 0, -(total_length - lip) / 2])
      cylinder(
        d = ball_diameter + 1 - 2 * rounding + 2 * lip,
        h = lip - 2 * rounding,
        center = true);
    }
    sphere(r=1);
  }

  cylinder(
    d = dart_diameter,
    h = total_length + 0.1,
    center = true);
}
