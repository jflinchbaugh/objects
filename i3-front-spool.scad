mount_width = 53; //mm
mount_thickness = 2.0; //mm
mount_height = 57; //mm

wall_thickness = 4.8; //mm
spool_thickness = mount_thickness + 2 * wall_thickness; //mm
spool_length = 85; //mm

rounding = 1; //mm

difference() {
  union() {
    rotate([0,2,0]) {
      minkowski() {
        cube([
              mount_width + 2 * wall_thickness - 2 * rounding,
              mount_thickness + 2 * wall_thickness - 2 * rounding,
              mount_height + 2 * wall_thickness - 2 * rounding
        ], true);
        sphere(r=rounding);
      }
    }

    translate([spool_length / 2 + wall_thickness, 0, mount_height / 2 ]) {
      rotate([0, 90, 0]) {
        cylinder(
          d = spool_thickness,
          h = spool_length + mount_width + 2 * wall_thickness,
          center = true);
      }
    }
  }
  rotate([0,2,0]) {
    translate([0, 0, -wall_thickness]) {
      cube([
            mount_width,
            mount_thickness,
            mount_height + 0.1
            ], true);
    }
  }
}
