pen_diameter = 17; //mm 
arm_height = 12; //mm 
thickness = 1.5; //mm
tab_length = arm_height;
gap = 1;//mm
screw_diameter = 3.2; //mm

$fn=60;

// a washer
*difference() {
    cylinder(r=arm_height/2, h = thickness);
    cylinder(r=screw_diameter / 2, h = thickness);
}

// the main arm
difference() {
    union() {
        cylinder(r=pen_diameter / 2 + thickness, h=arm_height);
        translate([- thickness, (pen_diameter / 2 + thickness + tab_length) * -1, 0]) {
            cube([
                thickness * 2, 
                pen_diameter + thickness * 2 + tab_length * 2, 
                arm_height
            ]);
        } 
    }
    cylinder(r=pen_diameter / 2, h=arm_height);
    translate([gap / -2, (pen_diameter / 2 + thickness + tab_length) * -1, 0]) {
        cube([
            gap, 
            pen_diameter + thickness * 2 + tab_length * 2, 
            arm_height
        ]);
    } 
    translate([
        -thickness, 
        (pen_diameter / 2 + thickness + tab_length / 2) * -1, 
        arm_height / 2
    ]) {
        rotate([0,90,0]) {
            cylinder(r=screw_diameter / 2, h = 2 * thickness);
        }
    }
    
    translate([
        -thickness, 
        (pen_diameter / 2 + thickness + tab_length / 2), 
        arm_height / 2
    ]) {
        rotate([0,90,0]) {
            cylinder(r=screw_diameter / 2, h = 2 * thickness);
        }
    }

}