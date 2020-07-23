wall_thickness = 1.2; //mm
pen_thickness = 21; // mm
pen_count = 2;
extra_width_between = 2; //mm
loop_height = 20; //mm
cut_shift = 0.1;
clip_width = pen_thickness;
clip_height = 2 * loop_height - pen_thickness / 2;
clip_gap = 5; // mm
clip_wall_thickness = 2 * wall_thickness;
clip_gap_radius = 2; //mm

$fn=24;

union() {
  ring();
  clip();
}

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

        minkowski() {
          hull() {
            translate([clip_wall_thickness, 0, (clip_gap + 2 * clip_wall_thickness) / 2])
              cube([
                  clip_width - 2 * clip_gap_radius,
                  clip_width + cut_shift,
                  clip_gap - 2 * clip_gap_radius],
                  true);
            translate([clip_height, 0, clip_wall_thickness + clip_gap_radius]) {
              cylinder(d=clip_width + cut_shift, h = clip_gap - 2 * clip_gap_radius);
            }
          }
          rotate([90,90,0]) {
            cylinder(h=0.1, r=clip_gap_radius);
          }
        }
      }
    }
  }
}
