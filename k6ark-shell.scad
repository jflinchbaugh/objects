length=34;
height=20;
width=27.1;
thickness=1.2;
$fn=24;

difference() {

  minkowski() {
    cube([length-2*thickness, width, height], center=true);
    sphere(thickness);
  }
  cube([length+0.1, width, height], center=true);
}
