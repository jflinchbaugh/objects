
module drawer(rail) {
  color([1.0, 1.0, 0.75]) {
    translate([0, 7, 0]) cube([24, 1, 3], center = true);
    translate([0, -7, 0]) cube([24, 1, 3], center = true);
    rotate([0,0,90]) translate([0, 11.5, 0]) cube([12 , 1, 3], center = true);
    rotate([0,0,90]) translate([0, -11.5, 0]) cube([12, 1, 3], center = true);

    rotate([90,0 ,90]) translate([0, -1, 0]) cube([12, 1, 3], center = true);
    rotate([90,0 ,90]) translate([0, -1, 6]) cube([12, 1, 3], center = true);
    rotate([90,0 ,90]) translate([0, -1, -6]) cube([12, 1, 3], center = true);
  }

  if (rail) {
    color([0.6, 0.6, 0.7]) {
      translate([0, 8, 0]) cube([23, 0.5, 1], center = true);
      translate([0, -8, 0]) cube([23, 0.5, 1], center = true);
    }
  }
}

translate([0,0,-8]) drawer(false);
translate([0,0,8]) drawer(true);

// tie
color([1.0,1.0,0.75])
rotate([0,90,90]) translate([0, 13, 0]) cube([19, 1, 3], center = true);

  // front
color([0.25, 0.5, 0.25]) {
  rotate([0,90,90])
    translate([-2, -13, 0])
      cube([30, 1, 17], center = true);
}

