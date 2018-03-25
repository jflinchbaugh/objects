width = 85;
height = 54.5;
thickness = 0.5;

difference() {
    
    cube([width + 2,height + 2, 1 + thickness + 1]);
    translate([1,1,1]) {
        cube([width, height,thickness]);
    }
    translate([2,2,1]) {
        cube([width - 2, height - 2, thickness + 1]);
    }
}