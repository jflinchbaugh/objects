plug_diameter=10.70;
plug_height=10;
plug_taper=0.5;

// 1 = print the fork/loop, 0 = cut holes to add wire
fork=0;
fork_length=15;
fork_thickness=2.0;
fork_angle=15;

hole_diameter=4.35;
hole_taper=0.5;
slot=1;

wire_hole_diameter=2;//mm

$fn=24;

difference() {
  union() {
    cylinder(d1=plug_diameter,d2=plug_diameter+plug_taper,h=plug_height);

    if (fork==1) {
      translate([(plug_diameter-fork_thickness)/2.7,0,1.25*plug_height]) {
        rotate([0,90+fork_angle,0]) {
          difference() {
            resize([fork_length,plug_diameter/1.25,fork_thickness]) {
              cylinder(d=fork_length,h=fork_thickness,center=true);
            }
            resize([fork_length-2*fork_thickness,plug_diameter/1.25-2*fork_thickness,fork_thickness+0.01]) {
              cylinder(d=fork_length,h=fork_thickness,center=true);
            }
          }
        }
      }

      translate([-(plug_diameter-fork_thickness)/2.7,0,1.25*plug_height]) {
        rotate([0,90-fork_angle,0]) {
          difference() {
            resize([fork_length,plug_diameter/1.25,fork_thickness]) {
              cylinder(d=fork_length,h=fork_thickness,center=true);
            }
            resize([fork_length-2*fork_thickness,plug_diameter/1.25-2*fork_thickness,fork_thickness+0.01]) {
              cylinder(d=fork_length,h=fork_thickness,center=true);
            }
          }
        }
      }
    }
  }

  if (fork!=1) {
    translate([
              (plug_diameter-wire_hole_diameter)/3.5,
              (plug_diameter-wire_hole_diameter)/3.5,
              plug_height/2]) {
      cylinder(d=wire_hole_diameter, h = plug_height+0.01,center = true);
    }
    translate([
            (plug_diameter-wire_hole_diameter)/-3.5,
            (plug_diameter-wire_hole_diameter)/3.5,
            plug_height/2]) {
      cylinder(d=wire_hole_diameter, h = plug_height+0.01,center = true);
    }
    translate([
            (plug_diameter-wire_hole_diameter)/-3.5,
            (plug_diameter-wire_hole_diameter)/-3.5,
            plug_height/2]) {
      cylinder(d=wire_hole_diameter, h = plug_height+0.01,center = true);
    }
    translate([
            (plug_diameter-wire_hole_diameter)/3.5,
            (plug_diameter-wire_hole_diameter)/-3.5,
            plug_height/2]) {
      cylinder(d=wire_hole_diameter, h = plug_height+0.01,center = true);
    }
  }

  translate([0,0,-0.01]) {
    cylinder(d1=hole_diameter,d2=hole_diameter-hole_taper,h=plug_height+0.02);
    translate([0,0,plug_height/3]) {
      cube([slot, plug_diameter+plug_taper, plug_height/1.5], center=true);
    }
  }
}
