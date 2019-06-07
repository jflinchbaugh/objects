// parameters for the seal
inner_diameter = 46; // mm
fins = 3; // mm
fin_thickness = 2; // mm
fin_height = 3; // mm

// parameters for the pressure top
bar_width = 18; // mm
bar_height_low = 4.5; // mm
bar_height_high = 11.5; // mm
bar_length = 58; // mm
bar_cut_out = 0; // mm
bar_hole = 3.5; // mm
bar_slot = 3.0; // mm
bar_cross_length = 50; // mm
bar_cross_offset = 0; // mm

$fn=120;

module fin() {
  union() {
    difference() {
      cylinder(
        d1=(inner_diameter - 2 * fin_height),
        d2=inner_diameter, h=fin_height
      );
      translate([0, 0, fin_thickness]) {
        cylinder(
          d1=(inner_diameter - 2 * fin_height),
          d2=inner_diameter, h=fin_height
        );
      }
    }
    cylinder(d=(inner_diameter - 2 * fin_height), h=fin_height + 1);
  }
}

module seal() {
  difference() {
    union() {
      for (i = [0:fins]) {
        translate([0, 0, i * fin_height]) {
          fin();
        }
      }

      // top
      translate([0, 0, fin_height * (fins + 1)]) {
        cylinder(
          d1=inner_diameter - 2 * fin_height,
          d2=inner_diameter + fin_height + 1, h=1.5 * fin_height
        );
      }

      translate([0, 0, fin_height * (fins + 2.5)]) {
        cylinder(d=inner_diameter + fin_height + 1, h=fin_height * 2);
      }
    }

    // hole
    translate([0, 0, fin_thickness]) {
      cylinder(
        d=inner_diameter - 3 * fin_height,
        h=fins * fin_height + fin_height * 4.5 - fin_thickness
      );
    }
  }
}

module bar() {
  rotate([0, -90, 0]) {
    difference() {
      translate([0, -5, 0]) {
        cube([bar_height_high + bar_hole / 2, 10 + bar_length, bar_width]);
      }
      translate([bar_height_low + bar_hole / 2, 0, 0]) {
        cylinder(d=bar_hole, h=bar_width);
      }
      translate([bar_height_low + bar_hole / 2, bar_slot / -2, 0]) {
        cube([bar_height_high - bar_height_low, bar_slot, bar_width]);
      }
      translate([bar_height_high + bar_hole / 2, bar_length, 0]) {
        cylinder(d=bar_hole, h=bar_width);
      }
      translate([0, 5, 0]) {
        cube([bar_cut_out, 15, bar_width]);
      }
      translate([0, bar_length - 25, 0]) {
          cube([bar_cut_out, 15, bar_width]);
      }
    }

    // cross
    translate([0, bar_length / 2 - bar_cross_offset, bar_width / 2]) {
      rotate([0, 90, 0]) {
        cylinder(d=bar_cross_length, h=bar_height_high + bar_hole / 2);
      }
    }
  }
}

// solid (petg) top cap
bar();

// soft (tpu) seal
translate([0, -1 * inner_diameter, 0]) {
  seal();
}


