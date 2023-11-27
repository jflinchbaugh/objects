terminalSpace = 36.0; //mm

terminalWidth = 8.6; //mm
terminalHeight = 3.5; //mm
terminalBottomOffset = 3.4; //mm
terminalLength = 9; //mm
terminalShellThickness = 2; //mm

plugWidth = 12; //mm
thickness = 4; //mm

tensionHoleDiameter = 5; //mm

radius = 1; //mm

$fn = 60;

blockWidth = terminalSpace + 2 * terminalWidth + 2 * thickness;
blockHeight = plugWidth + 2 * thickness;

difference() {
  // body
  minkowski() {
    union() {
      cube([blockWidth - 2 * radius,
            thickness - 2 * radius,
            blockHeight - 2 * radius],
           center = true);
      translate([0,
                 (terminalLength - thickness) / 2,
                 0 - (blockHeight - terminalHeight) / 2
                 + terminalBottomOffset]) {
        translate([(terminalSpace + terminalWidth) / 2, 0, 0]) {
          cube([terminalWidth + 2 * terminalShellThickness - 2 * radius,
            terminalLength - 2 * radius,
            terminalHeight + 2 * terminalShellThickness - 2 * radius],
          center = true);
        }
        translate([(terminalSpace + terminalWidth) / -2, 0, 0]) {
          cube([terminalWidth + 2 * terminalShellThickness - 2 * radius,
                terminalLength - 2 * radius,
                terminalHeight + 2 * terminalShellThickness - 2 * radius],
              center = true);
        }
      }
    }
    sphere(r = radius);
  }

  // socket
  rotate([90, 0, 0]) {
    cylinder(d=plugWidth, h = thickness + 0.01, center = true);
  }

  // terminals
  translate([0,
           (terminalLength - thickness) / 2,
             0 - (blockHeight - terminalHeight) / 2 + terminalBottomOffset]) {
    translate([(terminalSpace + terminalWidth) / 2, 0, 0]) {
      cube([terminalWidth,
            terminalLength + 0.01,
            terminalHeight],
           center = true);
    }
    translate([(terminalSpace + terminalWidth) / -2, 0, 0]) {
      cube([
            terminalWidth,
            terminalLength + 0.01,
            terminalHeight],
           center = true);
    }
  }

  // tension relief

    translate([0, 0,
             (blockHeight - tensionHoleDiameter) / 2 - thickness]) {
      translate([(blockWidth - tensionHoleDiameter) / 2 - thickness, 0, 0]) {
        rotate([90,0,0]) {
          cylinder(d = tensionHoleDiameter, h = thickness + 0.01, center = true);
        }
      }

      translate([(blockWidth - tensionHoleDiameter) / 2 - 2 * thickness - tensionHoleDiameter, 0, 0]) {
        rotate([90,0,0]) {
          cylinder(d = tensionHoleDiameter, h = thickness + 0.01, center = true);
        }
      }
    }
}

