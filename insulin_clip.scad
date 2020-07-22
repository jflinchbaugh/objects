wall_thickness = 1.2; //mm
pen_thickness = 18; // mm
pen_count = 2;
extra_width_between = 2; //mm
loop_height = 20; //mm
cut_shift = 0.1;
clip_width = pen_thickness;
clip_height = 2 * loop_height - pen_thickness / 2;
clip_gap = 13; // mm
clip_wall_thickness = 2 * wall_thickness;

ring();
    clip();

module ring() {
  difference() {
    hull() {
      cylinder(d=pen_thickness + 2 * wall_thickness, h=loop_height);
      translate([(pen_count - 1) * (pen_thickness + extra_width_between), 0, 0]) {
        cylinder(d=pen_thickness + 2 * wall_thickness, h=loop_height);
      }
    }
    translate([0, 0, -cut_shift]) {
      hull() {
        cylinder(d=pen_thickness, h=loop_height + 2 * cut_shift);
        translate([(pen_count - 1) * (pen_thickness + extra_width_between), 0, 0]) {
          cylinder(d=pen_thickness, h=loop_height + 2 * cut_shift);
        }
      }
    }
  }
}

module clip() {
  translate([
      (pen_count - 1) * (pen_thickness + extra_width_between) / 2,
      pen_thickness / 2,
      clip_width / 2 ]) {
    rotate([0, -90, -90]) {
      difference() {
        hull() {
          translate([0, 0, (clip_gap + 2 * clip_wall_thickness) / 2])
          cube([clip_width, clip_width, clip_gap + 2 * clip_wall_thickness], true);
          translate([clip_height, 0, 0]) {
            cylinder(d=clip_width, h=(clip_gap + 2 * clip_wall_thickness));
          }
        }

        hull() {
          translate([clip_wall_thickness, 0, (clip_gap + 2 * clip_wall_thickness) / 2])
            cube([clip_width, clip_width + cut_shift, clip_gap], true);
          translate([clip_height, 0, clip_wall_thickness]) {
            cylinder(d=clip_width + cut_shift, h=clip_gap);
          }
        }
      }
    }
  }
}
