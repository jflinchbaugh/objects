ball_diameter = 23.50; //mm
dart_diameter = 13.20; //mm
taper = 1; //mm
total_length = 50; //mm
lip = 5; //mm
rounding = 1; //mm

$fn=60;

difference() {
  minkowski() {
    union() {
      cylinder(
        d2 = ball_diameter - taper - 2 * rounding,
        d1 = ball_diameter + taper - 2 * rounding,
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
    d2 = dart_diameter - taper,
    d1 = dart_diameter + taper,
    h = total_length + 0.1,
    center = true);
}
