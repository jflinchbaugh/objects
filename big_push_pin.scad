// big push pin

bottom_radius = 30;
top_radius = 16;
height = 50;
nail_diameter = 3.5;

$fn=60;
difference() {
    union() {
        // bottom sphere
        translate([0,0,bottom_radius / -2]) {
            sphere(r=bottom_radius);
        }

        // top sphere
        translate([0,0,height + top_radius / 3 ]) {
            sphere(r=top_radius);
        }

        // center column
        cylinder(r1=bottom_radius/2.7, r2=top_radius/1.7, h = height);
    }

    // bottom cut-off
    translate([-bottom_radius,-bottom_radius, -2 * bottom_radius]) {
        cube([2 * bottom_radius,2 * bottom_radius ,2 * bottom_radius]);
    }
    
    // top cut-off
    translate([-top_radius,-top_radius,height]) {
        cube([2 * top_radius, 2 * top_radius, 2 * top_radius]);
    }
    
    // nail hole
    cylinder(r = diameter / 2, h = height / 2);
}