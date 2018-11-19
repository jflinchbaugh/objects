flange_width = 9.3;
flange_thickness = 2.1;
flange_neck = 7.0;
plate_thickness = 5;
plate_width = 15;
flange_height = 85;
plate_height = 105;
pairs = 4;
hole_diameter = 5;

$fn=40;

module set() {
    linear_extrude(flange_height) {
        square([flange_thickness, flange_width]);
        translate([0, (flange_width - flange_neck) / 2]) {
            square([plate_thickness + flange_thickness * 3, flange_neck]);
        }
        translate([plate_thickness + 2 * flange_thickness, 0]) {
            square([flange_thickness, flange_width]);
        }
    }
    linear_extrude(plate_height) {
        translate([
            flange_thickness * 1.5, 
            (plate_width - flange_width) / -2
        ]) {
            square([plate_thickness, plate_width]);
        }
    }
}

for(i = [0:pairs - 1]) {
    translate([0, i * plate_width]) {
        difference() {
            set();
        
            translate([
                0,
                flange_width / 2,
                //flange_height + (plate_height - flange_height) / 2
                plate_height - flange_width / 2 - hole_diameter / 4
            ]) {
                rotate([0,90,0]) {
                    cylinder(
                        d=hole_diameter, 
                        h=flange_thickness * 2 + plate_thickness
                    );
                }
            }
        }
    }
}
