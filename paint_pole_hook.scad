$fn=50;

thread_inside_diameter = 15.5;
thread_size = 6;
thread_length = 25;
wall_thickness = 2.4;
diameter = thread_inside_diameter + thread_size + wall_thickness * 2;
hook_length = 20;
rounding = 3;

// http://dkprojects.net/openscad-threads/threads.scad
use <threads.scad>

difference() {
  cylinder(d=diameter, h = thread_length + wall_thickness + hook_length);
  translate([0,0,-0.1]) {
    metric_thread(
      diameter=thread_inside_diameter + thread_size,
      pitch=5,
      thread_size=thread_size,
      length=thread_length,
      internal=true,
      square=true,
      leadin=0);
    cylinder(d=thread_inside_diameter, h = thread_length + hook_length - wall_thickness + 0.1);
  }
  translate([wall_thickness + rounding, diameter / -2, thread_length + wall_thickness + rounding]) {
    minkowski() {
      cube([diameter - rounding * 2, diameter, hook_length + wall_thickness * 2 - rounding * 2]);
      sphere(rounding);
    }
  }
  translate([wall_thickness * -1 - diameter + rounding, diameter / -2, thread_length + wall_thickness + rounding]) {
    minkowski() {
      cube([diameter - rounding * 2, diameter, hook_length + wall_thickness * 2 - rounding * 2]);
      sphere(rounding);
    }
  }
  translate([diameter / -2, 0, thread_length + wall_thickness]) {
    cube([diameter, diameter, hook_length - 2 * wall_thickness]);
  }
}
