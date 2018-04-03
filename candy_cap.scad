width = 19.4; //mm
height = 7; //mm
thickness = 1.5; //mm

difference() {
    cylinder(r = width / 2 + thickness, h = height + thickness);
    translate([0,0,thickness]) {
        cylinder(r = width / 2, h = height);
        translate([0 - width, - (thickness / 2), 0]) {
            cube([width * 2, thickness, height]);
        }
    }
}