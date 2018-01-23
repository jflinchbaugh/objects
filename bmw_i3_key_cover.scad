height = 61.5;
bottom_width = 44.2;
top_width = 49.65;
thickness = 10;

bottom_round = 5;
top_round = 10;

ring_offset = 14.3;

skin = 2;

$fn=40;

difference() {
    fob(
        height = height + skin * 2, 
        bottom_width = bottom_width + skin * 2, 
        top_width = top_width + skin * 2,
        thickness = thickness + skin * 2,
        bottom_round = bottom_round + skin * 2,
        top_round = top_round + skin * 2
    );

    union() {
        translate([0, skin, skin]) {
            fob(
                height = height, 
                bottom_width = bottom_width, 
                top_width = top_width,
                thickness = thickness,
                bottom_round = bottom_round,
                top_round = top_round
            );
        };
        translate([0, skin * 2, 0]) {
            fob(
                height = height - skin * 2,
                bottom_width = bottom_width - skin * 2,
                top_width = top_width - skin * 2,
                thickness = thickness + skin * 2,
                bottom_round = bottom_round,
                top_round = top_round
            );
        };
        
        translate([top_width / 2 - ring_offset, height, 0]) {
            cylinder(h = thickness + skin * 2, r = 2);
        }
    };
}


module fob() {
    linear_extrude(height = thickness) {
        minkowski() {
            polygon(points = [
                [0 - bottom_width / 2 + bottom_round, 0 + bottom_round], 
                [bottom_width / 2 - bottom_round, 0 + bottom_round], 
                [top_width / 2 - bottom_round, height - bottom_round], 
                [0 - top_width / 2 + bottom_round, height - bottom_round]
            ]);
            circle(bottom_round);
        };
    };
}