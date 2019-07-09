height = 16;
$fn=60;
difference() {
  hull() {
    cylinder(d=20.5, h = 2);
    translate([0,0,1]) {
      cylinder(d=20.5 + 2, h = height);
    }

    translate([0,0,height + 1]) {
      cylinder(d=20.5, h = 1);
    }
  }
  translate([0,0,1]) {
    cylinder(d=20.5, h=height + 2.1);
  }

  for (rot = [0:20:360]) {
    for (z=[2:4:height]) {
      translate([0,0,z]) {
        rotate([90,0,rot]) {
          cylinder(d=2, h=12, $fn=8);
        }
      }
    }
  }

  for (rot = [10:20:360]) {
    for (z=[4:4:height]) {
      translate([0,0,z]) {
        rotate([90,0,rot]) {
          cylinder(d=2, h=12, $fn=8);
        }
      }
    }
  }
}

