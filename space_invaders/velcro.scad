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

pinHeight = 3;
translate([-5,-5,0]) {
    cube([10, 10, 1]);
}
translate([0,0,1]) {
    pins(pinHeight, 0);
}
