$fn=24;
$connector=1;  //  BNC == 1,  Flange == 2

$toroid_hole_diameter = 10; //mm
$toroid_outer_diameter = 28; // for mount holes

$finger_length = 11;
$arm_width = 85; // distance between arm holes
$body_length = 100;
$body_width = 30;

$arm_width_offset = $arm_width / 2;
$body_length_offset = $body_length / 2;
$body_width_offset = $body_width / 2;

$wire_hole_diameter = 3;

module main_part()
  {
    linear_extrude(height = 4, center = true, convexity = 10 )
    {
    difference()
      {
      union()
        {
        // fingers
        hull() { translate ([ ($arm_width_offset+1.25), ($body_length_offset+$finger_length)])circle(d=7.5); translate ([($arm_width_offset+1.25),($body_length_offset-1.75)])circle(d=7.5); }
        hull() { translate ([-($arm_width_offset+1.25), ($body_length_offset+$finger_length)])circle(d=7.5); translate ([-($arm_width_offset + 1.25),($body_length_offset-1.75)])circle(d=7.5); }
        hull() { translate ([-($arm_width_offset+1.25),-($body_length_offset+$finger_length)])circle(d=7.5); translate ([-($arm_width_offset + 1.25),-($body_length_offset-1.75)])circle(d=7.5); }
        hull() { translate ([ ($arm_width_offset+1.25),-($body_length_offset+$finger_length)])circle(d=7.5); translate ([($arm_width_offset + 1.25),-($body_length_offset-1.75)])circle(d=7.5); }

        // arm
        hull() { translate ([    ($arm_width_offset - 1), ($body_length_offset-1.75)])circle(d=12); translate ([-($arm_width_offset - 1), ($body_length_offset-1.75)])circle(d=12);
                 translate ([    ($arm_width_offset - 1), ($body_length_offset+5.25)])circle(d=12); translate ([-($arm_width_offset - 1), ($body_length_offset+5.25)])circle(d=12); }
        // arm
        hull() { translate ([    ($arm_width_offset - 1),-($body_length_offset-1.75)])circle(d=12); translate ([-($arm_width_offset - 1),-($body_length_offset-1.75)])circle(d=12);
                 translate ([    ($arm_width_offset - 1),-($body_length_offset+5.25)])circle(d=12); translate ([-($arm_width_offset - 1),-($body_length_offset+5.25)])circle(d=12); }
        // center body
        hull() { translate ([    0,$body_length_offset+15]) resize([$body_width+6.5,25])circle(r=50);
          hull() { translate ([($body_width_offset-0.5),-($body_length_offset+12)]) circle(d=7.5);translate ([ -($body_width_offset-0.5), -($body_length_offset+12)])circle(d=7.5); }
        }
        square([($body_width+44),$body_length],center=true);
        }

      // cut out arms
      hull() {
        translate([($arm_width_offset-10.75), ($body_length_offset+12)]) circle(d=16.5);
        translate([($body_width_offset+11.5),($body_length_offset+12)]) circle(d=16.5);
        translate([($arm_width_offset-10.75), ($body_length_offset+17)]) circle(d=16.5);
        translate([($body_width_offset+11.5),($body_length_offset+17)]) circle(d=16.5);
      }
      hull() {
        translate ([-($arm_width_offset-10.75), ($body_length_offset+12)]) circle(d=16.5);
        translate ([-($body_width_offset+11.5),($body_length_offset+12)])circle(d=16.5);
        translate ([-($arm_width_offset-10.75), ($body_length_offset+17)]) circle(d=16.5);
        translate ([-($body_width_offset+11.5),($body_length_offset+17)]) circle(d=16.5);
      }
      hull() {
        translate([($arm_width_offset-10.75),-($body_length_offset+12)]) circle(d=16.5);
        translate([($body_width_offset+11.5),-($body_length_offset+12)]) circle(d=16.5);
        translate([($arm_width_offset-10.75),-($body_length_offset+17)]) circle(d=16.5);
        translate([($body_width_offset+11.5),-($body_length_offset+17)])circle(d=16.5);
      }
      hull() {
        translate ([-($arm_width_offset-10.75),-($body_length_offset+12)]) circle(d=16.5);
        translate ([-($body_width_offset+11.5),-($body_length_offset+12)]) circle(d=16.5);
        translate ([-($arm_width_offset-10.75),-($body_length_offset+17)]) circle(d=16.5);
        translate ([-($body_width_offset+11.5),-($body_length_offset+17)])circle(d=16.5);
      }

      // cut out handle
      translate ([0, ($body_length_offset+15)]) resize([$body_width,20])circle(r=50);

      // cut out between arms
      hull() {
        translate([ ($body_width_offset+22),   ($body_length_offset-27.75)])circle(d=40); translate ([($body_width_offset+22),-($body_length_offset-27.75)])circle(d=40);
      }
      hull() {
        translate([-($body_width_offset+22),   ($body_length_offset-27.75)])circle(d=40); translate ([-($body_width_offset+22),-($body_length_offset-27.75)])circle(d=40);
      }
      }
    }
  }

module remove_part()
  {
  translate([0,0,2.5])linear_extrude(height = 4, center = true, convexity = 10 )
    {
    difference()
      {
      union()
        {
          // fingers
        hull() {
          translate([($arm_width_offset+1.25), ($body_length_offset+$finger_length)]) circle(d=4.5);
          translate([($arm_width_offset + 1.25),($body_length_offset-1.75)]) circle(d=4.5); }
        hull() {
          translate([-($arm_width_offset+1.25), ($body_length_offset+$finger_length)]) circle(d=4.5);
          translate([-($arm_width_offset + 1.25),($body_length_offset-1.75)]) circle(d=4.5); }
        hull() {
          translate([-($arm_width_offset+1.25),-($body_length_offset+$finger_length)]) circle(d=4.5);
          translate([-($arm_width_offset + 1.25),-($body_length_offset-1.75)])circle(d=4.5); }
        hull() { translate([ ($arm_width_offset+1.25),-($body_length_offset+$finger_length)])circle(d=4.5); translate ([($arm_width_offset + 1.25),-($body_length_offset-1.75)])circle(d=4.5); }
        hull() { translate ([    ($arm_width_offset - 1), ($body_length_offset-1.75)])circle(d=9); translate ([-($arm_width_offset - 1), ($body_length_offset-1.75)])circle(d=9);
                 translate ([    ($arm_width_offset - 1), ($body_length_offset+7)])circle(d=9); translate ([-($arm_width_offset - 1), ($body_length_offset+7)])circle(d=9); }
        hull() { translate ([    ($arm_width_offset - 1),-($body_length_offset-1.75)])circle(d=9); translate ([-($arm_width_offset - 1),-($body_length_offset-1.75)])circle(d=9);
                 translate ([    ($arm_width_offset - 1),-($body_length_offset+8)]) circle(d=9); translate ([-($arm_width_offset - 1),-($body_length_offset+8)])circle(d=9); }
        hull() { translate ([    0,($body_length_offset+15)]) resize([$body_width+3.5,23])circle(r=($body_length_offset+12));
          hull() { translate ([($body_width_offset-0.5),-($body_length_offset+12)])circle(d=4.5);translate ([ -($body_width_offset-0.5), -($body_length_offset+12)])circle(d=4.5); }
            }
        square([($body_width+44),$body_length],center=true);
        }

      // cut out arms
      hull() {
        translate([($arm_width_offset-10.75), ($body_length_offset+12)]) circle(d=19.5);
        translate([($body_width_offset+11.5),($body_length_offset+12)]) circle(d=19.5);
        translate([($arm_width_offset-10.75), ($body_length_offset+17)]) circle(d=19.5);
        translate ([($body_width_offset+11.5),($body_length_offset+17)]) circle(d=19.5); }

      hull() {
        translate([ ($arm_width_offset-10.75),-($body_length_offset+12)]) circle(d=19.5); translate ([($body_width_offset+11.5),-($body_length_offset+12)])circle(d=19.5);
        translate ([ ($arm_width_offset-10.75),-($body_length_offset+17)])circle(d=19.5); translate ([($body_width_offset+11.5),-($body_length_offset+17)])circle(d=19.5); }
      hull() { translate ([-($arm_width_offset-10.75), ($body_length_offset+12)]) circle(d=19.5); translate ([-($body_width_offset+11.5),($body_length_offset+12)]) circle(d=19.5);
               translate ([-($arm_width_offset-10.75), ($body_length_offset+17)]) circle(d=19.5); translate ([-($body_width_offset+11.5),($body_length_offset+17)])circle(d=19.5); }
      hull() { translate ([-($arm_width_offset-10.75),-($body_length_offset+12)])circle(d=19.5); translate ([-($body_width_offset+11.5),-($body_length_offset+12)])circle(d=19.5);
               translate ([-($arm_width_offset-10.75),-($body_length_offset+17)]) circle(d=19.5); translate ([-($body_width_offset+11.5),-($body_length_offset+17)])circle(d=19.5); }
               translate ([  0,   ($body_length_offset+15)]) resize([$body_width+1,22])circle(r=50);

      // cut out between arms
      hull() { translate ([ ($body_width_offset+22),   ($body_length_offset-27.75)])circle(d=43); translate ([($body_width_offset+22),-($body_length_offset-27.75)])circle(d=43); }
      hull() { translate ([-($body_width_offset+22),   ($body_length_offset-27.75)])circle(d=43); translate ([-($body_width_offset+22),-($body_length_offset-27.75)])circle(d=43); }
      }
    }
  }

difference()
{
  union()
  {
    difference() {
      main_part();
      remove_part();
    }

    // pad in toroid
    cylinder(d=$toroid_hole_diameter + 2,h=2.5, center = true);

    // screw pads near handle
    translate([9,($body_length_offset-3),-0.5])cylinder(d=10,h=3,center=true);
    translate([-9,($body_length_offset-3),-0.5])cylinder(d=10,h=3,center=true);


    // screw pads on connector end
    translate([9,-$body_length_offset+18,-0.5])cylinder(d=10,h=3,center=true);
    translate([-9,-$body_length_offset+18,-0.5])cylinder(d=10,h=3,center=true);
  }

  // holes to mount toroid
  rotate([0,0,45]) {
    translate([0,0,0]) cylinder(d=$toroid_hole_diameter,h=15,center=true);
    translate([$toroid_outer_diameter/2,0,0]) cylinder(d=6,h=15,center=true);
    translate([-$toroid_outer_diameter/2,0,0]) cylinder(d=6,h=15,center=true);
    translate([0, $toroid_outer_diameter/2,0]) cylinder(d=6,h=15,center=true);
    translate([0, -$toroid_outer_diameter/2,0]) cylinder(d=6,h=15,center=true);
  }

  // holes in arms
  translate([-$arm_width_offset,-$body_length_offset+2,0])cylinder(d=6,h=15,center=true);
  translate([$arm_width_offset,-$body_length_offset+2,0])cylinder(d=6,h=15,center=true);
  translate([-$arm_width_offset,$body_length_offset-2,0])cylinder(d=6,h=15,center=true);
  translate([$arm_width_offset,$body_length_offset-2,0])cylinder(d=6,h=15,center=true);

  // wire holes near handle
  translate([18,$body_length_offset+1,0])cylinder(d=$wire_hole_diameter,h=15,center=true);
  translate([18,$body_length_offset-5.5,0])cylinder(d=$wire_hole_diameter,h=15,center=true);
  translate([-18,$body_length_offset+1,0])cylinder(d=$wire_hole_diameter,h=15,center=true);
  translate([-18,$body_length_offset-5.5,0])cylinder(d=$wire_hole_diameter,h=15,center=true);

  // screw holes near handle
  translate([9,($body_length_offset-3),0])cylinder(d=5,h=15,center=true);
  translate([-9,($body_length_offset-3),0])cylinder(d=5,h=15,center=true);

  // screw holes on connector end
  translate([9,-$body_length_offset+18,0])cylinder(d=5,h=15,center=true);
  translate([-9,-$body_length_offset+18,0])cylinder(d=5,h=15,center=true);

  // wire holes on connector end
  translate([18,-($body_length_offset+1),0])cylinder(d=$wire_hole_diameter,h=15,center=true);
  translate([18,-($body_length_offset-5.5),0])cylinder(d=$wire_hole_diameter,h=15,center=true);
  translate([-18,-($body_length_offset+1),0])cylinder(d=$wire_hole_diameter,h=15,center=true);
  translate([-18,-($body_length_offset-5.5),0])cylinder(d=$wire_hole_diameter,h=15,center=true);
  }

// bnc
if($connector==1)
  {
  translate ([0,-$body_length/2-14.25,10])
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
  translate ([0,-$body_length/2-15.8,13])
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

