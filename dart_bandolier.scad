// foam dart holder suitable to be sewn onto a bandolier strap

count = 6;
diameter = 12.4;
space = 2;
radius = 1;
thickness = 15;
hole_ratio = 1.3;

difference() {
    translate([radius,radius,radius]) {
        minkowski() {
            cube([
                (diameter + space) * count + space - radius * 2, 
                thickness - radius * 2, 
                space/2 + diameter - radius * 2
            ]);
            sphere(radius);
        }
    }
    for (x = [0:1:count - 1]) {
        translate([(x+0.5) * (diameter + space) + space/2, 0, diameter/2 + space]) {
            translate([-diameter/(hole_ratio*2), 0, 0]) {
                cube([diameter/hole_ratio, thickness + 1, diameter/hole_ratio + radius]);
            }
            rotate([270,0,0]) {
                cylinder(r=diameter/2, h=thickness + 1);
            }
            
            translate([0,thickness / 5,-(diameter/2+space)]) {
                cylinder(r=0.75, h=space + 1);
            }
            translate([0,thickness - thickness / 5,-(diameter/2+space)]) {
                cylinder(r=0.75, h=space + 1);
            }
        }
    }
}