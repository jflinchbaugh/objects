$fn=48;
difference() {
  minkowski() {
    linear_extrude(5) {
      text(
        text = "\u03BB",
        size = 100,
        halign="center",
        font = "FreeMono:style=Bold"
      );
    }
    sphere(3, $fn=24);
  }
  translate([-10, 50, -3]) {
    cube([20, 5, 5]);
  }
  translate([-10, 50, 0]) {
    cube([20, 6, 2]);
  }
}
