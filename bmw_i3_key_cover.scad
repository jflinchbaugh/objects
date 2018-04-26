height = 61;
bottom_width = 44;
top_width = 49;
thickness = 10.5;

bottom_round = 5;
top_round = 10;

ring_offset = 14.3;

face_skin = 1.2;
side_skin = 2.4;

cover_height = 45;

$fn=40;

difference() {
    fob(
        height = height + side_skin * 2, 
        bottom_width = bottom_width + side_skin * 2, 
        top_width = top_width + side_skin * 2,
        thickness = thickness + face_skin * 4,
        bottom_round = bottom_round + side_skin * 2,
        top_round = top_round + side_skin * 2
    );

    union() {
        translate([0, side_skin, face_skin * 2]) {
            fob(
                height = height, 
                bottom_width = bottom_width, 
                top_width = top_width,
                thickness = thickness,
                bottom_round = bottom_round,
                top_round = top_round
            );
        };
        translate([0, side_skin * 2, face_skin]) {
            fob(
                height = height - side_skin * 2,
                bottom_width = bottom_width - side_skin * 2,
                top_width = top_width - side_skin * 2,
                thickness = thickness + face_skin * 2,
                bottom_round = bottom_round,
                top_round = top_round
            );
        };
        translate([
            0 - bottom_width / 2 + side_skin * 2, 
            side_skin * 2, 
            face_skin
        ]) {
            cube([
                bottom_width - side_skin * 4,
                height + side_skin * 2,
                thickness + face_skin * 2
            ]);
        };
        
        translate([
            0 - top_width / 2 - side_skin, 
            cover_height, 
            thickness + face_skin * 3
        ]) {
            cube([
                top_width + side_skin * 2,
                height + side_skin * 2 - cover_height, 
                face_skin
            ]); 
        };
        translate([
            0 - top_width / 2 - side_skin, 
            cover_height, 
            0
        ]) {
            cube([
                top_width + side_skin * 2,
                height + side_skin * 2 - cover_height, 
                face_skin
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