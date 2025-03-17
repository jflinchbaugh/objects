// organizer to hold specific pocket items in a flat row

thickness = 10; // mm
wall_thickness = 2.4; //mm

holders([
         [24, 24],
         [40, 20],
         [26, 26],
         [15, 15],
         ]);

function first(lst) = lst[0];
function rest(lst) = (len(lst) <= 1) ? [] : [for (i = [1:len(lst)-1]) lst[i]];

module holder(width, height) {
  translate([width/2,height/2+1.5*wall_thickness,0]) {
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

module holders(dimensions) {
  dim = first(dimensions);
  if (dim) {
    holder(dim[0], dim[1]);
    others = rest(dimensions);

    translate([dim[0] + wall_thickness, 0, 0]) {
      holders(others);
    }
  }
}
