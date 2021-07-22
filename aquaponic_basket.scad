height = 80; //mm
outer_diameter = 45; //mm
thickness = 1.2; //mm
lip = 5; //mm
taper = 3; //mm
slot_width = 4; //mm
slot_height = height/4; //mm
slot_angle = 30; //degrees
bottom_diameter = (outer_diameter-taper)*3/5;
$fn=60;

difference() {
  union() {
    cylinder(
             d1=outer_diameter - taper,
             d2=outer_diameter,
             h=height,
             center=true);
    translate([0, 0, (height - lip) / 2]) {
      cylinder(
               d2=outer_diameter + 2 * lip,
               d1=outer_diameter,
               h=lip,
               center=true);
    }
  }
  
  // main hole
  translate([0, 0, thickness]) {
    cylinder(
             d1=outer_diameter - taper- thickness * 2,
             d2=outer_diameter - thickness * 2,
             h=height, center = true);
  }
  
  
  //slots
  for (h=[0:slot_angle:180]) {
      rotate([0,0,h]){
          for (v=[-2:1:1]) {
              translate([0,0,v*(slot_height+slot_height/6)]) { 
                cube([
                  outer_diameter, 
                  slot_width,
                  slot_height], 
                  center = true);
              }
          }
      }
  }
}

translate([0, 0, (thickness-height) / 2]) {
  cylinder(
           d=bottom_diameter,
           h=thickness,
           center=true);
}