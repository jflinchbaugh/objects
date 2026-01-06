$fn=8;
rotate_extrude() {
  difference() {
    union() {
      square([6,5], center=true);
      translate([0,0.75]) {
        square([10,2], center=true);
      }
      translate([0, -4]) {
        square([2,15], center=true);
      }

      translate([0, -8]) {
        square([6,3], center=true);
      }
    }
    translate([0,-25]) {
      square([10, 50]);
    }
  }
}

// legs

for(i=[0:90:270]) {
  rotate([0,0,i-5]) {
    rotate_extrude(angle=10) {
      translate([-5, -9.5]) {
        square([5, 2], center=true);
      }

      translate([-7, -10]) {
        square([2,10], center=true);
      }
    }
  }
}
