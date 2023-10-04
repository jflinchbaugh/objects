hole = 5.5; //mm
width= 14; //mm
thickness = 1;//mm
$fn = 24;

linear_extrude(thickness) {
  difference() {
    circle(d=width);
    circle(d=hole);
  }
}
