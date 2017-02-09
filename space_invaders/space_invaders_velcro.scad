module pin(height) {
    cylinder(r = 0.5, h = height - 1.1);
    cylinder(r1 = 0.7, r2 = 0.5, h = 0.2);
    translate([0,0,height - 1.1]) {
        cylinder(r1 = 0.5, r2 = 0.7, h = 0.1);
    }
    translate([0,0,height - 1]) {
        cylinder(r1 = 0.7, r2 = 0, h = 1);
    }
}

module pins(height, size) {
    for (x = [-size - 4:4:size + 4]) {
        for (y = [-size - 4:4:size + 4]) {
            translate([x,y,0]) {
                pin(height);
            }
        }
    }
}

scale([1, 1, 0.5], false) {
    import("space_invaders.stl");
}

pinHeight = 3;

translate([0,0,2.5]) {
    translate([17.75,4,0]) pins(pinHeight, -1);

    translate([18,-19.5,0]) pins(pinHeight, -1);

    translate([-22.5,8,0]) pins(pinHeight, -1);

    translate([-22.75,-17,0]) pins(pinHeight, -1);

    translate([-21.75,33,0]) pins(pinHeight, -1);
}