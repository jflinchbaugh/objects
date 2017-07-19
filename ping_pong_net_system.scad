// ping pong net sysytem using rubberbands for tension

// receiver part
table_thickness = 20.5; //mm 
length = 50;
receiver = true;
thumb=true; // holds under table
tab=0; //mm, for use with spring clamps on table

// rail part
rail=true; //mm
rail_length = 190; //mm

if (receiver) {
    difference() {
        union() {
            // thumb
            if (thumb) {
                translate([10, 0, 0]) {
                    cube([20, length, 10]);
                }
            }
            
            // back
            cube([40, 10, 10 + table_thickness + 15]);

            // top
            translate([0, 0, 10 + table_thickness]) {
                cube([40, length, 15]);
                // tab
                cube([40 + tab, length, 5]);
            }
            
            // hooks
            translate([5, 5, 10 + table_thickness + 15]) {
                cylinder(r=2.5,h=10,$fn=6);
            }
            translate([40-5, 5, 10 + table_thickness + 15]) {
                cylinder(r=2.5,h=10,$fn=6);
            }
        }
        translate([20,0, 7.5+10 + table_thickness]) {
            rotate([270,0,0]) {
                linear_extrude(height = length) {
                    rotate(270) {
                        circle(15,$fn=3);
                    }
                }
            }
        }
    }
}

if (rail) {
    translate([100,0,7]) {
        difference() {
            rotate([270,0,0]) {
                linear_extrude(height = rail_length) {
                    rotate(270) {
                        circle(14,$fn=3);
                        translate([14, 0, 0]) {
                            circle(3);
                        }
                    }
                }
            }

            translate([-7,0,7]) {
                cube([14, 20, 10]);
            }
            translate([-7,rail_length-20,7]) {
                cube([14, 20, 10]);
            }
            
            for (x=[20:16:rail_length-20]) {
                translate([-7,x,7]) {
                    cube([14, 12, 10]);
                }
            }
        }
      
        // post
        translate([0,5,0]) {
            cylinder(r=4, h=115,$fn=6);
        }
    }
}
