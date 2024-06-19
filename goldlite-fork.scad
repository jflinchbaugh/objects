plug_diameter=10.70;
plug_height=10;
plug_taper=0.5;
fork_length=15;
fork_thickness=2.0;
fork_angle=15;

$fn=24;

cylinder(d1=plug_diameter,d2=plug_diameter+plug_taper,h=plug_height);

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
