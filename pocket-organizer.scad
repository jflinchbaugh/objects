// organizer to hold specific pocket items flat

thickness = 10; // mm
wall_thickness = 2.4; //mm

module holder(width, height) {
  translate([0,height/2+1.5*wall_thickness,0]) {
    difference() {
      minkowski() {
        cube([width, height+wall_thickness, thickness-2*wall_thickness], center=true);
        sphere(r=wall_thickness);
      }
      translate([0,wall_thickness/2, 0]) {
        cube([width, height, thickness+0.01], center=true);
      }
    }
  }
}

pills_diam=24;
translate([pills_diam/2+wall_thickness,0,0]) {
  holder(pills_diam, pills_diam);
}

multitool_height=20;
multitool_width=40;
translate([pills_diam+multitool_width/2+2*wall_thickness,0,0]) {
  holder(multitool_width, multitool_height);
}

cough_drops_diam=26;
translate([(multitool_width+pills_diam+cough_drops_diam/2 + 3* wall_thickness),0,0]) {
  holder(cough_drops_diam, cough_drops_diam);
}

chapstick_diam=15;
translate([(multitool_width+pills_diam+cough_drops_diam+chapstick_diam/2 + 4 * wall_thickness),0,0]) {
  holder(chapstick_diam, chapstick_diam);
}
