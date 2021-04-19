// end cap for handlebars that can receive a certain bike mirror

cap_radius=19.8/2;
cap_length=20;
cap_side_thickness=2.4;
cap_slot_thickness=1;

cap_lip_thickness=cap_side_thickness / 2;
cap_lip_radius=cap_radius+cap_side_thickness;

arm_length=13;
arm_radius=7.83/2;

joint_radius=cap_radius - cap_side_thickness;
joint_height=arm_radius * 2 - cap_side_thickness;
joint_screw_hole_radius=3.3/2;
joint_free_hole_radius=3.9/2;
joint_tolerance=0.4;

ring_thickness=1.85;
ring_radius=11.05/2;
ring_spacing=3.23;

cap=true;
arm=false;

$fn=60;

// cap
if (cap) {
  difference() {
    union() {
      cylinder(r=cap_radius, h=cap_length, center=true);
      translate([0,0,(cap_lip_thickness-cap_length)/2]) {
        cylinder(r=cap_lip_radius, h=cap_lip_thickness, center=true);
      }
      translate([0,0,-cap_length/2]) {
        cylinder(
          r=joint_radius - joint_tolerance,
          h=(joint_height + joint_tolerance) * 2,
          center=true);
      }
    }
    translate([0,0,-cap_length/2]) {
      cylinder(
        r=joint_screw_hole_radius,
        h=(joint_height + joint_tolerance) * 2 + 0.01,
        center=true);
    }
    translate([0,0,cap_side_thickness]) {
      cylinder(
        r=cap_radius-cap_side_thickness,
        h=cap_length-cap_side_thickness+0.01,
        center=true);
      for (r=[0:90:90]) {
        rotate([0,0,r]) {
          cube([
            cap_slot_thickness,
            cap_radius * 2,
            cap_length-cap_side_thickness],
            center=true);
        }
      }
    }
  }
}

// arm
if (arm) {
  translate([cap_radius + joint_radius + cap_side_thickness * 2, 0, 0]) {
    intersection() {
      // disc for full height
      cylinder(
        r=joint_radius + cap_side_thickness + arm_length + ring_thickness,
        h=joint_height + cap_side_thickness,
        center=true);
      union() {
        difference() {
          cylinder(
            r=joint_radius + cap_side_thickness,
            h=joint_height + cap_side_thickness,
            center=true);
          translate([0,0,cap_side_thickness/2]) {
            cylinder(
              r=joint_radius,
              h=joint_height + 0.01,
              center=true);
          }
          cylinder(
            r=joint_free_hole_radius,
            h=joint_height + cap_side_thickness + 0.01,
            center=true);
        }
        translate([joint_radius + cap_side_thickness / 2 + arm_length/2,0,0]) {
          rotate([0,90,0]) {
            cylinder(
              r=arm_radius,
              h=arm_length,
              center=true);
          }
        }
        translate([joint_radius + cap_side_thickness / 2 + arm_length,0,0]) {
          rotate([0,90,0]) {
            cylinder(
              r=ring_radius,
              h=ring_thickness,
              center=true);
            translate([0,0,-ring_spacing]) {
              cylinder(
                r=ring_radius,
                h=ring_thickness,
                center=true);
            }
          }
        }
      }
    }
  }
}
