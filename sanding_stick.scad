spring_length = 35; // mm
band_thickness = 7; // mm
band_length = 155; // mm

guide_thickness = band_thickness / 2;

difference() {
    linear_extrude(band_thickness) {
        difference() {
            union() {
                circle(band_thickness/2);
                translate([0, band_thickness / -2]) {
                    square([band_length - 20, band_thickness]);
                    polygon(points = [
                        [band_length - 20, 0], 
                        [band_length, 0], 
                        [band_length - 20, band_thickness]
                    ]);
                }
            }
            translate([(band_length - spring_length) / 2, band_thickness / -2]) {
                square([spring_length / 2, band_thickness]);
            }
        }
    }
    translate([20, guide_thickness / -2, guide_thickness / 2]) {
        cube([band_length - 40, guide_thickness, guide_thickness]);
    }
}

translate([0, 10, 0]) {
    cube([
        band_length - 20 - spring_length, 
        guide_thickness - 0.12, 
        guide_thickness - 0.12
    ]);
}
