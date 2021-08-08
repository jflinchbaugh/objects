disc_diameter = 210; //mm
arm_thickness = 8; //mm
arm_length = disc_diameter*2/3; //mm
arm_tooth_length = 20; //mm
arm_tooth_grip = 5; //mm

thumb_tooth_length = arm_tooth_length; //mm 
thumb_length = disc_diameter*1/3; //mm
thumb_tooth_grip = 3; //mm
thumb_string_hole_diameter = 5; //mm

screw_diameter=3.0; //mm
screw_tolerance=0.5; //mm

center_height = arm_thickness;
center_width = 4 * arm_thickness;
center_length = 4 * arm_thickness;

center_tab_thickness = 3; //mm
center_tab_height = thumb_tooth_length;
center_tab_angle = -15; // degrees
attach_hole_diameter = 5; //mm

hinge_tolerance = 0.5;

$fn=60;

module thumb() {
  difference() {
    linear_extrude(height=arm_thickness, center=true) {
      polygon(points=[[0,0],
                      [0, arm_thickness],
                      [thumb_length-arm_thickness, arm_thickness],
                      [thumb_length-arm_thickness, arm_thickness+thumb_tooth_length],
                      [thumb_length-arm_thickness, arm_thickness+thumb_tooth_length-arm_thickness],
                      [thumb_length-arm_thickness-thumb_tooth_grip, arm_thickness+thumb_tooth_length-arm_thickness],
                      [thumb_length-arm_thickness-thumb_tooth_grip, arm_thickness+thumb_tooth_length],
                      [thumb_length, arm_thickness+thumb_tooth_length],
                      [thumb_length, 0],
                      [thumb_length/2, 0],
                      [thumb_length/4, -thumb_tooth_length/2],
                      [thumb_length/4+thumb_string_hole_diameter, -thumb_tooth_length],
                      [thumb_length/4-arm_thickness/2-thumb_string_hole_diameter/2, -thumb_tooth_length],
                      [thumb_length/4-arm_thickness/2-thumb_string_hole_diameter/2, 0]
                      ]);
    }
    translate([arm_thickness/2, arm_thickness/2, 0]) {
      cylinder(d=screw_diameter + screw_tolerance, h=arm_thickness + 0.1, center=true);
    }
    translate([thumb_length/4-thumb_string_hole_diameter/2,
               -thumb_tooth_length+thumb_string_hole_diameter,
               0]) {
      cylinder(d=thumb_string_hole_diameter, h=arm_thickness + 0.1, center=true);
    }
  }
}

module arm() {
  difference() {
    linear_extrude(height=arm_thickness, center=true) {
      polygon(points=[[0,0],
                      [0, arm_thickness],
                      [arm_length-arm_thickness, arm_thickness],
                      [arm_length-arm_thickness, arm_thickness+arm_tooth_length],
                      [arm_length-arm_thickness, arm_thickness+arm_tooth_length-arm_thickness],
                      [arm_length-arm_thickness-arm_tooth_grip, arm_thickness+arm_tooth_length-arm_thickness],
                      [arm_length-arm_thickness-arm_tooth_grip, arm_thickness+arm_tooth_length],
                      [arm_length, arm_thickness+arm_tooth_length],
                      [arm_length, 0]
                      ]);
    }
    translate([arm_thickness/2, arm_thickness/2, 0]) {
      rotate([90,0,0]) {
        cylinder(d=screw_diameter+screw_tolerance, h=arm_thickness + 0.1, center=true);
      }
    }
  }
}

module center() {
  difference() {
    union() {
      cube([center_length, center_width, center_height], center=true);

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


    //thumb hinge
    translate([(center_length - arm_thickness)/2,
               0,
               0]) {
      rotate([90,0,0]) {
        cylinder(d=screw_diameter, h=center_width + 0.1, center=true);
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

