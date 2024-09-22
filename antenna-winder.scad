$fn=24;
$connector=1;  //  BNC == 1,  SO-239 == 2
$thickness = 4;

$toroid_hole_diameter = 10; //mm
$toroid_outer_diameter = 28; // for mount holes

$finger_length = 50;
$body_length = 100;
$body_width = 32;

$body_length_offset = $body_length / 2;
$body_width_offset = $body_width / 2;

$wire_hole_diameter = 3;

module main_part() {
  linear_extrude(height = $thickness, center = true, convexity = 10 ) {
    difference() {
      union() {
        // fingers
        hull() {
          translate ([ ($body_width_offset+$finger_length/sqrt(2)), ($body_length_offset+$finger_length/sqrt(2))])
              circle(d=7);
            translate ([($body_width_offset-5),($body_length_offset-5)])
              circle(d=20);
        }
        hull() {
          translate ([-($body_width_offset+$finger_length/sqrt(2)), ($body_length_offset+$finger_length/sqrt(2))])
            circle(d=7);
          translate ([-($body_width_offset-5),($body_length_offset-5)])
            circle(d=20);
        }
        hull() {
          translate ([-($body_width_offset+$finger_length/sqrt(2)),-($body_length_offset+$finger_length/sqrt(2))])
            circle(d=7);
          translate ([-($body_width_offset-5),-($body_length_offset-5)])
            circle(d=20);
        }
        hull() {
          translate ([ ($body_width_offset+$finger_length/sqrt(2)),-($body_length_offset+$finger_length/sqrt(2))])
            circle(d=7);
          translate ([($body_width_offset-5),-($body_length_offset-5)])
            circle(d=20);
        }

        // center body
        hull() {
          //handle
          translate ([0, ($body_length_offset+10)])
            resize([20,20])
            circle(r=50);
          //body
          translate ([($body_width_offset-0.5),$body_length_offset])
            circle(d=7.5);
          translate ([-($body_width_offset-0.5),$body_length_offset])
            circle(d=7.5);
          translate ([($body_width_offset-0.5),-$body_length_offset])
            circle(d=7.5);
          translate ([ -($body_width_offset-0.5), -$body_length_offset])
            circle(d=7.5);
          }
      }

      // cut out handle
      translate ([0, ($body_length_offset+10)])
        resize([12,12])
        circle(r=50);

    }
  }
}

difference()
{
  main_part();

  // holes to mount toroid
  translate([0,16,0]) {
    rotate([0,0,45]) {
      translate([0,0,0]) cylinder(d=$toroid_hole_diameter,h=15,center=true);
      translate([$toroid_outer_diameter/2,0,0]) cylinder(d=6,h=15,center=true);
      translate([-$toroid_outer_diameter/2,0,0]) cylinder(d=6,h=15,center=true);
      translate([0, $toroid_outer_diameter/2,0]) cylinder(d=6,h=15,center=true);
      translate([0, -$toroid_outer_diameter/2,0]) cylinder(d=6,h=15,center=true);
    }
  }

  // screw holes near handle
  translate([9,($body_length_offset-3),0])cylinder(d=5,h=15,center=true);
  translate([-9,($body_length_offset-3),0])cylinder(d=5,h=15,center=true);

  // wire holes near handle
  translate([0,$body_length_offset-3,0])cylinder(d=$wire_hole_diameter,h=15,center=true);
  translate([0,$body_length_offset-8,0])cylinder(d=$wire_hole_diameter,h=15,center=true);

  // screw holes on connector end
  translate([9,-$body_length_offset+35,0])cylinder(d=5,h=15,center=true);
  translate([-9,-$body_length_offset+35,0])cylinder(d=5,h=15,center=true);

  // wire holes on connector end
  translate([0,-$body_length_offset+35,0])cylinder(d=$wire_hole_diameter,h=15,center=true);
  translate([0,-$body_length_offset+30,0])cylinder(d=$wire_hole_diameter,h=15,center=true);
}

// bnc
if($connector==1)
  {
  translate ([0,-$body_length_offset-2.25,$thickness/2 + 8.5])
  difference()
  {
  union()
    {
    hull()
      {
      translate([10,0,-10])sphere(d=3);
      translate([10,0,10])sphere(d=3);
      translate([-10,0,-10])sphere(d=3);
      translate([-10,0,10])sphere(d=3);
      }
    hull()
      {
      translate([-10,20,-10])sphere(d=3);
      translate([-10,0,-10])sphere(d=3);
      translate([-10,0,10])sphere(d=3);
      }
   hull()
      {
      translate([10,20,-10])sphere(d=3);
      translate([10,0,-10])sphere(d=3);
      translate([10,0,10])sphere(d=3);
      }
      }
    difference()
      {
      translate([0,0,0])rotate([90,0,0])cylinder(d=9.75,h=5,center=true);
      translate([0,0,-9.25])cube([10,5,10],center=true);
      }
    }
  }

// so239
if($connector==2)
  {
  translate ([0,-$body_length_offset-2,$thickness/2+13])
  difference()
    {
    union()
      {
      hull()
        {
        translate([13,0,-13])sphere(d=3);
        translate([13,0,13])sphere(d=3);
        translate([-13,0,-13])sphere(d=3);
        translate([-13,0,13])sphere(d=3);
        }
      hull()
        {
        translate([-13,26,-13])sphere(d=3);
        translate([-13,0,-13])sphere(d=3);
        translate([-13,0,13])sphere(d=3);
        }
      hull()
        {
        translate([13,26,-13])sphere(d=3);
        translate([13,0,-13])sphere(d=3);
        translate([13,0,13])sphere(d=3);
        }
      translate([9,2,9])rotate([90,0,0])cylinder(d=8,h=3,center=true);
      translate([9,2,-9])rotate([90,0,0])cylinder(d=8,h=3,center=true);
      translate([-9,2,9])rotate([90,0,0])cylinder(d=8,h=3,center=true);
      translate([-9,2,-9])rotate([90,0,0])cylinder(d=8,h=3,center=true);
      }
    translate([0,-1,0])cube([26,2,26],center=true);
    translate([9,0,9])rotate([90,0,0])cylinder(d=3,h=8,center=true);
    translate([9,0,-9])rotate([90,0,0])cylinder(d=3,h=8,center=true);
    translate([-9,0,9])rotate([90,0,0])cylinder(d=3,h=8,center=true);
    translate([-9,0,-9])rotate([90,0,0])cylinder(d=3,h=8,center=true);
    translate([0,0,0])rotate([90,0,0])cylinder(d=13,h=5,center=true);
    translate([9,5,9])rotate([90,0,0])cylinder(d=5,h=6,center=true,$fn=6);
    translate([9,5,-9])rotate([90,0,0])cylinder(d=5,h=6,center=true,$fn=6);
    translate([-9,5,9])rotate([90,0,0])cylinder(d=5,h=6,center=true,$fn=6);
    translate([-9,5,-9])rotate([90,0,0])cylinder(d=5,h=6,center=true,$fn=6);
    }
  }

