disc_diameter = 210; //mm
arm_thickness = 8; //mm
arm_length = disc_diameter*2/3; //mm
arm_tooth_length = 20; //mm
arm_tooth_grip = 5; //mm
arm_back_stop = 15; //mm
arm_latch = 1; //mm

thumb_tooth_length = arm_tooth_length; //mm 
thumb_length = disc_diameter*1/3 + arm_thickness; //mm
thumb_tooth_grip = 3; //mm
thumb_string_hole_diameter = 5; //mm

screw_diameter=3.0; //mm
screw_tolerance=0.5; //mm

attach_hole_diameter = 6.5; //mm
center_height = arm_thickness;
center_width = 5 * attach_hole_diameter;
center_length = 4 * arm_thickness;

center_tab_thickness = 5; //mm
center_tab_height = thumb_tooth_length;
center_tab_angle = -15; // degrees

rounding=2; //mm

hinge_tolerance = 0.5;

$fn=60;

module thumb() {
  difference() {
    linear_extrude(height=arm_thickness, center=true) {
      minkowski() {
        polygon(points=[[rounding, rounding],
                      [rounding, arm_thickness-rounding],
                      [thumb_length-arm_thickness+rounding,
                       arm_thickness-rounding],
                      [thumb_length-arm_thickness+rounding,
                       arm_thickness+thumb_tooth_length-arm_thickness+rounding],
                      [thumb_length-arm_thickness-thumb_tooth_grip+rounding,
                       arm_thickness+thumb_tooth_length-rounding],
                      [thumb_length-rounding,
                       arm_thickness+thumb_tooth_length-rounding],
                      [thumb_length-rounding,
                       rounding],
                      [2*arm_thickness-rounding,
                       rounding],
                      [arm_thickness-rounding,
                       -thumb_tooth_length/2],
                      [arm_thickness + thumb_string_hole_diameter-rounding,
                       -thumb_tooth_length+rounding],
                      [rounding,
                       -thumb_tooth_length+rounding],
                      [rounding,
                       rounding]
                      ]);
        circle(r=rounding);
      }
    }
    translate([arm_thickness/2, arm_thickness/2, 0]) {
      cylinder(d=screw_diameter + screw_tolerance, h=arm_thickness + 0.1, center=true);
    }
    translate([rounding+thumb_string_hole_diameter/2,
               -thumb_tooth_length+thumb_string_hole_diameter,
               0]) {
      cylinder(d=thumb_string_hole_diameter, h=arm_thickness + 0.1, center=true);
    }
  }
}

module arm() {
  difference() {
    linear_extrude(height=arm_thickness, center=true) {
      minkowski() {
        polygon(points=[[rounding,
                         rounding-arm_latch],
                      [rounding,
                       arm_thickness-rounding],
                      [arm_length+arm_back_stop-arm_thickness+rounding,
                       arm_thickness-rounding],
                      [arm_length+arm_back_stop-arm_thickness+rounding,
                       arm_thickness+arm_tooth_length-arm_thickness+rounding],
                      [arm_length+arm_back_stop-arm_thickness-arm_tooth_grip+rounding,
                       arm_thickness+arm_tooth_length-rounding],
                      [arm_length+arm_back_stop-rounding,
                       arm_thickness+arm_tooth_length-rounding],
                      [arm_length+arm_back_stop-rounding,
                       rounding],
                      [rounding+arm_latch,
                       rounding]
                      ]);
        circle(r=rounding);
      }
    }
    translate([arm_thickness/2+arm_back_stop, arm_thickness/2, 0]) {
      rotate([90,0,0]) {
        cylinder(d=screw_diameter+screw_tolerance, h=arm_thickness + 0.1, center=true);
      }
    }
  }
}

module center() {
  difference() {
    union() {
      linear_extrude(height=center_height, center=true) {
        minkowski() {
          square([center_length-2*rounding, center_width-2*rounding], center=true);
          circle(r=rounding);
        }
      }

      // tab
      rotate([0,center_tab_angle,0]) {
        translate([-center_tab_thickness/2,0,(center_tab_height + center_height)/2]) {
          difference() {
            cube([center_tab_thickness, center_width, center_tab_height + center_height], center=true);
            translate([0,
                       center_width/2-attach_hole_diameter,
                       (center_tab_height+center_height)/2-attach_hole_diameter]) {
              rotate([0,90,0]) {
                cylinder(d=attach_hole_diameter,h=center_tab_thickness + 0.1, center=true);
              }
            }
          }
        }
      }
    }
    translate([center_length/4,0,0]) {
      cube([center_length/2 + 0.1, arm_thickness + hinge_tolerance, center_height + 0.1], center=true);
    }


    //thumb hinge small hole
    translate([(center_length - arm_thickness)/2,
               -center_width/2,
               0]) {
      rotate([90,0,0]) {
        cylinder(d=screw_diameter, h=center_width + 0.1, center=true);
      }
    }
    //thumb hinge large hole
    translate([(center_length - arm_thickness)/2,
               center_width/2,
               0]) {
      rotate([90,0,0]) {
        cylinder(d=screw_diameter+screw_tolerance, h=center_width + 0.1, center=true);
      }
    }

    // arm hinges
    translate([-(center_length - arm_thickness)/2,
               -(center_width - arm_thickness)/2,
               0]) {
      cylinder(d=screw_diameter, h=arm_thickness + 0.1, center=true);
    }
    translate([-(center_length - arm_thickness)/2,
               (center_width - arm_thickness)/2,
               0]) {
      cylinder(d=screw_diameter, h=arm_thickness + 0.1, center=true);
    }
  }
}

center();

translate([0, 2 * arm_tooth_length, 0]) {
  thumb();
}

translate([0, 4 * arm_tooth_length, 0]) {
  arm();
}

translate([0, 6 * arm_tooth_length, 0]) {
  arm();
}

