mount_width = 53; //mm
mount_thickness = 2.0; //mm
mount_height = 57; //mm

wall_thickness = 4.0; //mm
spool_thickness = 14; //mm
spool_length = 85 ; //mm

rounding = 1; //mm

$fn=16;

difference() {
  union() {
    minkowski() {
      difference() {
        union() {
          cube([
                 mount_width + 2 * wall_thickness - 2 * rounding,
                 mount_thickness + 2 * wall_thickness - 2 * rounding,
                 mount_height + 2 * wall_thickness - 2 * rounding
                 ], true);
          translate([spool_length / 2 + wall_thickness, 0, mount_height / 2]) {
            rotate([0, 90 - 2, 0]) {
              cylinder(
                d = spool_thickness - 2 * rounding,
                h = spool_length + mount_width + 2 * wall_thickness - 2 * rounding,
                center = true);
              translate([
                          0,
                          0,
                          spool_length / 2
                          + mount_width / 2
                          + 2 * wall_thickness
                          - 2 * rounding]) {
                cylinder(
                  d1 = spool_thickness - rounding,
                  d2 = spool_thickness + rounding,
                  h = wall_thickness,
                  center = true);
              }
              translate([
                          0,
                          0,
                          0 - (spool_length / 2
                          + mount_width / 2
                          + 2 * wall_thickness
                          - 3 * rounding)]) {
                cylinder(
                  d1 = mount_thickness + 2 * wall_thickness,
                  d2 = spool_thickness - 2 * rounding,
                  h = wall_thickness / 2 + rounding,
                  center = true);
              }
            }
          }
        }
        translate([0, 0, -wall_thickness]) {
          cube([
                 mount_width + 2 * rounding,
                 mount_thickness + 2 * rounding,
                 mount_height + 2 * rounding + 0.1
                 ],
               true);
        }
      }
      sphere(r=rounding);
    }
  }
}
