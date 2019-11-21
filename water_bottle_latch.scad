width = 18.5;
depth= 13; // 6.8;
height = 3.0;
tooth_size = 1.2;

finger_width = height / 2;
finger_length = 3.5;

slot_offset = 2.3; //
slot_thickness = 5; //
slot_width = 12;
slot_tab_thickness = 1.8; // mm
slot_tab_width = 7; // mm
slot_tab_depth = 2;

union() {
  difference() {
    cube([width, depth, height]);
    translate([finger_width, 0, 0]) {
      cube([width - 2 * finger_width, finger_length, height]);
    }

    // bend slots
    translate([finger_width, 0, 0]) {
      cube([finger_width / 2, 2 * finger_length, height]);
    }
    translate([width - 1.5 * finger_width, 0, 0]) {
      cube([finger_width / 2 , 2 * finger_length, height]);
    }

    // slot
    translate([(width - slot_width) / 2, depth - slot_offset - slot_thickness, 0]) {
      cube([slot_width, slot_thickness, height]);
    }
  }

  // slot tab
  translate([(width - slot_tab_width) / 2, depth - slot_offset - slot_thickness,0]) {
    cube([slot_tab_width, slot_tab_depth, slot_tab_thickness]);
  }

  // side teeth
  translate([-tooth_size, 0, 0]) {
    cube([tooth_size, tooth_size, tooth_size]);
  }
  translate([width, 0, 0]) {
    cube([tooth_size, tooth_size, tooth_size]);
  }
}
