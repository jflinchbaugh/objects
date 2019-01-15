finger_width = 6.52; // mm
space = 6.52; // mm
length = 22.57; // mm
finger_height = 4.05; // mm
tpc=6.5; // mm
tooth_depth=0.70; // mm
top_height = 10.0; //6.56; //mm
hole_diameter = 6.9; //mm
hole_depth = 4.84; // mm
platform_height = 5; //mm
$fn=60;

module finger() {
        difference() {
            square([finger_width, length]);
            for (i = [0:(10/tpc):length]) {
                translate([0, i]) {
                    polygon([
                        [0, 0],
                        [0, (10/tpc)],
                        [tooth_depth, (5/tpc)]
                    ]);
                 }
             }
        }
}

// lower with fingers
linear_extrude(finger_height) {
    translate([space / 2, 0]) {
        finger();
    }
    mirror([1,0]) {
        translate([space / 2, 0]) {
            finger();
        }
    }
}

difference() {
    union() {
        // upper
        translate([- finger_width - (space / 2), 0, finger_height]) {
            cube([
                finger_width * 2 + space, 
                length, 
                top_height
            ]);
        }
        
        // platform
        translate([
            length / -2,
            0,
            finger_height + top_height - platform_height
            ]) {
            cube([
                length, 
                length, 
                platform_height
            ]);
        }  
    }   
    
    // hole
    translate([0, length / 2, finger_height + top_height - hole_depth]) {
        cylinder(h=hole_depth, d=hole_diameter);
     }
}
