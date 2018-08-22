outside = 12.5; //mm
inside = 5.6; //mm
length = 72; //mm 
foam_thickness = 0.8;
twist = 180;

cap_height = 9; //mm

$fn=50;

translate([0,0,cap_height]) {
    linear_extrude(height = length - cap_height, center = false, convexity = 0, twist = twist, slices = $fn, scale = 1.0) {
        difference() {
            circle(d=outside);
            circle(d=outside - foam_thickness * 2);
        }
        difference() {
            circle(d=inside + foam_thickness * 2);
            circle(d=inside);
        }
        
        for (a = [0:60:360]) {
            rotate(a) {
                translate([inside / 2, 0, 0]) {
                    square([(outside - inside - foam_thickness) / 2 , foam_thickness]);
                }
            }
        }
    }
}

rotate_extrude() {
    polygon([[0,0],[0,cap_height], [outside / 2, cap_height], [outside / 2.5, 0]]);
}
