stick_thick=2.15; // mm
stick_width = 9.42; // mm
diameter = 90; // mm
thickness = 6;  // mm
stick_count = floor(diameter / (stick_width * 1.5) * PI); 
floor_thickness = 0.8; // mm

step = 360 / stick_count;
$fn = stick_count; 

linear_extrude(thickness) {
    difference() {
      circle(d=diameter);
      for (i = [step:step:365]) {
          rotate([0,0,i + step / 2]) {
              translate([diameter / 2 - 2 * stick_thick, 0]) {
                  square([stick_thick, stick_width], true);
              }
          }
      }
      circle(d=diameter - 7 * stick_thick);
    }
}

linear_extrude(floor_thickness) {
    circle(d=diameter);
}