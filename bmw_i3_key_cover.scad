height = 61;
bottom_width = 44;
top_width = 49;
thickness = 11;

bottom_round = 5;
top_round = 10;

ring_offset = 14.3;

skin = 2.5;

cover_height = 45;

$fn=40;

difference() {
    fob(
        height = height + skin * 2, 
        bottom_width = bottom_width + skin * 2, 
        top_width = top_width + skin * 2,
        thickness = thickness + skin * 4,
        bottom_round = bottom_round + skin * 2,
        top_round = top_round + skin * 2
    );

    union() {
        translate([0, skin, skin * 2]) {
            fob(
                height = height, 
                bottom_width = bottom_width, 
                top_width = top_width,
                thickness = thickness,
                bottom_round = bottom_round,
                top_round = top_round
            );
        };
        translate([0, skin * 2, skin]) {
            fob(
                height = height - skin * 2,
                bottom_width = bottom_width - skin * 2,
                top_width = top_width - skin * 2,
                thickness = thickness + skin * 2,
                bottom_round = bottom_round,
                top_round = top_round
            );
        };
        translate([0 - bottom_width / 2 + skin * 2, skin * 2, skin]) {
            cube([
                bottom_width - skin * 4,
                height + skin * 2,
                thickness + skin * 2
            ]);
        };
        
        translate([
            0 - top_width / 2 - skin, 
            cover_height, 
            thickness + skin * 3
        ]) {
            cube([
                top_width + skin * 2,
                height + skin * 2 - cover_height, 
                skin
            ]); 
        };
        translate([
            0 - top_width / 2 - skin, 
            cover_height, 
            0
        ]) {
            cube([
                top_width + skin * 2,
                height + skin * 2 - cover_height, 
                skin
            ]); 
        };
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