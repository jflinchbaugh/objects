x_width = 6.25;
y_width = 8.8;
z_height = 100;

wall_thickness = 1.2;
radius = 0.5;

base_width = 40;
base_thickness = 3;
wire_thickness = 3.1;

$fn=60;

difference() {
  union() {
    translate([base_width / -2 + x_width / 2, base_width / -2 + y_width / 2, 0]) {
      minkowski() {
        cube([base_width - 2 * radius, base_width - 2 * radius, base_thickness - 0.1]);
        cylinder(r=radius + wall_thickness, 0.1);
      }
    }
    minkowski() {
      cube([x_width - 2 * radius, y_width - 2 * radius, z_height - 0.1]);
      cylinder(r=radius + wall_thickness, 0.1);
    }
  }
  translate([0,0,-0.1]) {
    minkowski() {
      cube([x_width - 2 * radius, y_width - 2 * radius, z_height + 0.1]);
      cylinder(r=radius, 0.1);
    }
  }

  // slit
  translate([radius, radius, -0.1]) {
    minkowski() {
      cube([base_width / 2, y_width - 4 * radius, wire_thickness + 0.1]);
      cylinder(r=radius, 0.1);
    }
  }
}
