x_width = 6.5;
y_width = 9.25;
z_height = 100;

wall_thickness = 1.2;
radius = 0.5;

base_width = 40;
base_thickness = 3;
wire_thickness = 4.0;
back_slit = 3;

$fn=60;

difference() {
  union() {
    // base
    translate([base_width / -2 + x_width / 2, base_width / -2 + y_width / 2, 0]) {
      minkowski() {
        cube([base_width - 2 * radius, base_width - 2 * radius, base_thickness - 0.1]);
        cylinder(r=radius + wall_thickness, 0.1);
      }
    }

    // upright tube
    minkowski() {
      cube([x_width - 2 * radius, y_width - 2 * radius, z_height - 0.1]);
      cylinder(r=radius + wall_thickness, 0.1);
    }

    // inside chamfer
    translate([-radius, -radius, 0]) {
      minkowski() {
        cube([x_width, y_width, base_thickness]);
        cylinder(r1=(2 * radius + wall_thickness), r2=0, 2 * radius + wall_thickness);
      }
    }
  }

  // center cut-out
  translate([0,0,-0.1]) {
    minkowski() {
      cube([x_width - 2 * radius, y_width - 2 * radius, z_height + 0.1]);
      cylinder(r=radius, 0.1);
    }
  }

  // wire slit
  translate([radius, radius, -0.1]) {
    minkowski() {
      cube([base_width / 2, y_width - 4 * radius, wire_thickness + 0.1]);
      cylinder(r=radius, 0.1);
    }
  }
  // back slit
  translate([-0.1, (y_width - 2 * radius - back_slit) / 2 , base_thickness + radius]) {
    rotate([0,-90,0]) {
      cube([z_height + 0.2, back_slit, wall_thickness + radius + 0.1]);
    }
  }
}
