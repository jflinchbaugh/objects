battery_length = 67;
battery_width = 37;

board_length = 52.75;
board_width = 27.1;

wall_thickness = 1.6;
inner_height = 11;
floor_thickness = 1.2;
board_support_height=4;
board_support_width=1.75;

slot_width = 5;
port_width = 14;
port_height = 0;

top_height = (inner_height + floor_thickness) * 0.5;
top_tolerance = 0.50;

screen_width = 26.5;
screen_height = 14.5;
screen_y_offset = 7.0;
screen_x_offset = 10;
screen_border_thickness = 0.5;

button_spacing = 15.75;
button_depth = 1.3;
button_width = 6;
button_inset = 5;

// choose the part to print
bottom = true;
top = true;

$fn=24;

if (top) {
  translate([board_length / 2 + 5 , 0, (top_height+floor_thickness)/2]) {
    difference() {
      translate([0,(battery_length+wall_thickness)/2,0]) {
        box(
            board_length+2*wall_thickness+2*top_tolerance,
            board_width+battery_length+wall_thickness+2*wall_thickness+2*top_tolerance,
            top_height);
      }
      // cut port
      translate([
          -(board_length+3*wall_thickness)/2-top_tolerance,
          0,
          floor_thickness]) {
        cube([wall_thickness*2, port_width, top_height], center=true);
      }

      // cut screen
      translate([
          (board_length+2*wall_thickness-screen_width)/2+top_tolerance-screen_x_offset,
          -(board_width+2*wall_thickness-screen_height)/2-top_tolerance+screen_y_offset,
          -(top_height)/2]) {
        cube([screen_width, screen_height, 2 * floor_thickness], center=true);
      }

      // cut buttons
      translate([
          -(board_length+2*wall_thickness)/2+top_tolerance+button_inset,
          (button_spacing)/2,
          -(top_height)/2]) {
        cylinder(d=button_width+1.5,h=2*floor_thickness, center=true);
      }
      translate([
          -(board_length+2*wall_thickness)/2+top_tolerance+button_inset,
          -(button_spacing)/2,
          -(top_height)/2]) {
        cylinder(d=button_width+1.5,h=2*floor_thickness, center=true);
      }
    }

    // buttons
    translate([
        -(board_length+2*wall_thickness)/2+top_tolerance+button_inset,
        (button_spacing)/2,
        -(top_height)/2]) {
      cylinder(d=button_width,h=floor_thickness, center=true);
      translate([0,-button_width/2,0]) {
        cube([2,2,floor_thickness], center=true);
      }
      translate([0,0,(button_depth+floor_thickness)/2]) {
        cylinder(d=button_width/2,h=floor_thickness+button_depth, center=true);
      }
    }
    translate([
        -(board_length+2*wall_thickness)/2+top_tolerance+button_inset,
        -(button_spacing)/2,
        -(top_height)/2]) {
      cylinder(d=button_width,h=floor_thickness, center=true);
      translate([0,button_width/2,0]) {
        cube([2,2,floor_thickness], center=true);
      }
      translate([0,0,(button_depth+floor_thickness)/2]) {
        cylinder(d=button_width/2,h=floor_thickness+button_depth, center=true);
      }
    }

    // screen border
    translate([
        (board_length+2*wall_thickness-screen_width)/2+top_tolerance-screen_x_offset,
        -(board_width+2*wall_thickness-screen_height)/2-top_tolerance+screen_y_offset,
        -(top_height)/2 + screen_border_thickness]) {
      difference() {
        border_height = floor_thickness + screen_border_thickness;
        cube([screen_width + 2 * wall_thickness,
              screen_height + 2 * wall_thickness,
              border_height],
             center=true);
        cube([screen_width,
              screen_height,
              border_height + 0.1],
             center=true);
      }
    }
  }
}

if (bottom) {
  translate([-board_length / 2 - 5, 0, (inner_height+floor_thickness)/2]) {
    difference() {
      union() {
        // outer wall
        translate([0,(battery_length+wall_thickness)/2,0]) {
          box(
              board_length,
              board_width+battery_length+wall_thickness,
              inner_height);
        }

        // board box
        box(board_length, board_width, inner_height);

        // board support
        translate([
                  0,
                  (board_width-board_support_width)/2,
                  -(inner_height-board_support_height-floor_thickness)/2]) {
          cube([board_length-2*slot_width, board_support_width,board_support_height], center=true);
        }
        translate([
                  0,
                  -(board_width-board_support_width)/2,
                  -(inner_height-board_support_height-floor_thickness)/2]) {
          cube([board_length, board_support_width,board_support_height], center=true);
        }


        // battery box
        translate([(
                    board_length-battery_width)/2,
                  (battery_length+board_width)/2+wall_thickness,
                  0]) {
          box(battery_width, battery_length, inner_height);
        }
      }

      // cut wiring slots
      translate([
        (board_length-slot_width)/2,
        (board_width+wall_thickness)/2,
        floor_thickness]) {
      cube([
            slot_width,
            2*wall_thickness,
            inner_height+floor_thickness],
          center = true);
      }

      translate([
              -(board_length-slot_width)/2,
              (board_width+wall_thickness)/2,
                floor_thickness]) {
        cube([
              slot_width,
              2*wall_thickness,
              inner_height+floor_thickness],
            center = true);
      }

      // cut port
      translate([
              (board_length+wall_thickness)/2,
              0,
              floor_thickness+port_height+board_support_height]) {
        cube([wall_thickness*2, port_width, inner_height], center=true);
      }
    }
  }
}

module box(inner_width, inner_length, inner_height) {
  difference() {
    cube([
          inner_width+2*wall_thickness,
          inner_length+2*wall_thickness,
          inner_height+floor_thickness],
         center = true);
    translate([0, 0, floor_thickness]) {
      cube([
            inner_width,
            inner_length,
            inner_height+floor_thickness],
           center = true);
    }
  }
}
