mount_width = 50; //mm
mount_thickness = 1.74; //mm
mount_height = 50; //mm

wall_thickness = 5; //mm
spool_thickness = 18; //mm
spool_length = 85; //mm

difference() {
  union() {
    rotate([0,2,0]) {
      cube([
            mount_width + 2 * wall_thickness,
            mount_thickness + 2 * wall_thickness,
            mount_height + wall_thickness
      ], true);
    }

    translate([spool_length / 2, 0, mount_height / 2 + spool_thickness / 2]) {
      rotate([0, 90, 0]) {
        cylinder(
          d = spool_thickness,
          h = spool_length + mount_width + 2 * wall_thickness,
          center = true);
      }
    }
  }
  rotate([0,2,0]) {
    translate([0, 0, - wall_thickness]) {
      cube([
            mount_width,
            mount_thickness,
            mount_height
            ], true);
    }
  }
}
