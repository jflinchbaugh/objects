module pin(height) {
    cylinder(r = 0.1, h = height);
    translate([0,0,height]) {
        cylinder(r1 = 0.1, r2 = 0.2, h = 0.1);
    }
    translate([0,0,height + 0.1]) {
        cylinder(r1 = 0.2, r2 = 0, h = 0.2);
    }
}

module pins(height, size) {
    for (x = [-size:1:size]) {
        for (y = [-size:1:size]) {
            translate([x,y,0]) {
                pin(height);
            }
        }
    }
}

scale([1, 1, 0.5], false) {
    import("space_invaders.stl");
}

pinHeight = 3.25;

translate([7,2,0]) pins(pinHeight, 1);
translate([17,2,0]) pins(pinHeight, 2);
translate([27,2,0]) pins(pinHeight, 1);

translate([8,-23,0]) pins(pinHeight, 1);
translate([17.25,-20,0]) pins(pinHeight, 2);
translate([27,-23,0]) pins(pinHeight, 1);

translate([-10,2,0]) pins(pinHeight, 1);
translate([-23.5,6,0]) pins(pinHeight, 2);
translate([-37,2,0]) pins(pinHeight, 1);

translate([-23.75,-20,0]) pins(pinHeight, 2);

translate([-11,27,0]) pins(pinHeight, 1);
translate([-22.7,31,0]) pins(pinHeight, 2);
translate([-34.5,27,0]) pins(pinHeight, 1);
