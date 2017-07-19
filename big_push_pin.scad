// big push pin

bottom_radius = 60;
top_radius = 33;
height = 100;
nail_diameter = 3.2;

$fn=50;
difference() {
    union() {
        translate([0,0,-30]) {
            sphere(r=bottom_radius);
        }
        translate([0,0,105]) {
            sphere(r=top_radius);
        }
        cylinder(r1=23, r2=20, h = height);
    }
    translate([-1 * bottom_radius,-1 * bottom_radius, -2 * bottom_radius]) {
        cube([2 * bottom_radius,2 * bottom_radius ,2 * bottom_radius]);
    }
    translate([-50,-50,100]) {
        cube([100,100,100]);
    }
    cylinder(r=diameter/2, h=15);
}