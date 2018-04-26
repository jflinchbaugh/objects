width = 19.5; //mm
height = 7; //mm
thickness = 1.5; //mm
pitch = thickness / 2; //mm

$fn=60;

difference() {
    cylinder(r = width / 2 + thickness, h = height + thickness);
    translate([0,0,thickness]) {
        cylinder(r1= width / 2 + pitch, r2 = width / 2, h = height);
        translate([0 - width, - (thickness / 2), 0]) {
            cube([width * 2, thickness, height]);
        }
    }
}