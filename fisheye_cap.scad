diameter = 62; // mm
thickness = 2.5; // mm
height=20; //mm
fins=8;

$fn = 60;

difference() {
    cylinder(r=diameter/2 + thickness + 0.5, h= height + thickness);
    translate([0,0,thickness]) {
        cylinder(r=diameter/2 + 0.5, h=height);
    }
}

for (x=[1:fins]) {
    rotate([0,0,x*360/fins]) {
        translate([-0.5,diameter/2,0]) {
            cube([1,1,height + thickness]);
        }
    }
}