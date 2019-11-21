$fn=50;

diameter = 25;

// http://dkprojects.net/openscad-threads/threads.scad
use <threads.scad>

difference() {
    translate([0,0, 0.5]) {
        cylinder(d=diameter, h=26);
        translate([0,0,26 + 15]) {
            difference() {
                cube([4,diameter,30], true);
                translate([0, 4, 0]) {
                    cube([4.5, diameter - 3.9, 22], true);
                }
            }
        }
    }
  
    metric_thread(diameter=21, pitch=5, thread_size=6, length=25, internal=true, square=true, leadin=0);
}