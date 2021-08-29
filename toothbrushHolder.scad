height = 15; //mm
hole = 10; //mm
thickness = 5; //mm

difference() {
    cylinder(
        h=height,
        d=hole+thickness);
    translate([2.7, 0, 0]){
        cylinder(
            h=height+1,
            d=hole);
    }
    translate([-26,-10,0]){
        cube(21);
    }   
}