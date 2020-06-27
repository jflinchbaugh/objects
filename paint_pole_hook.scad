// http://dkprojects.net/openscad-threads/threads.scad
use <threads.scad>

$fn=60;

thread_inside_diameter = 16;
thread_size = 6;
thread_length = 15;
wall_thickness = 2.4;
diameter = thread_inside_diameter + thread_size + wall_thickness * 2;
hook_length = 15;
hook_thickness = 7.0;
rounding = 3;

difference() {
  // main body
  translate([0,0,rounding])
  minkowski() {
    cylinder(d=diameter - 2 * rounding, h = thread_length + hook_thickness + hook_length - 2 * rounding);
    sphere(rounding);
  }

  // cut out thread
  translate([0,0,-0.1]) {
    metric_thread(
      diameter=thread_inside_diameter + thread_size,
      pitch=5,
      thread_size=thread_size,
      length=thread_length,
      internal=true,
      square=true,
      leadin=0);
  }

  // cut out hook center rounded
  translate([0,0,thread_length + wall_thickness + rounding]) {
    minkowski() {
      cylinder(d=thread_inside_diameter - 2 * rounding, h = hook_length - wall_thickness - 2 * rounding);
      sphere(rounding);
    }
  }

  // cut out side 1
  translate([hook_thickness / 2 + rounding, diameter / -2, thread_length + wall_thickness + rounding]) {
    minkowski() {
      cube([diameter - rounding * 2, diameter, hook_length + hook_thickness]);
      sphere(rounding);
    }
  }

  // cut out side 2
  translate([hook_thickness / 2 * -1 - diameter + rounding, diameter / -2, thread_length + wall_thickness + rounding]) {
    minkowski() {
      cube([diameter - rounding * 2, diameter, hook_length + hook_thickness]);
      sphere(rounding);
    }
  }

  // cut out the end of the opening of the ehook
  translate([diameter / -2, 0, thread_length + wall_thickness]) {
    cube([diameter, diameter, hook_length - wall_thickness]);
  }
}
