plug_width = 11.2; //mm
plug_height = 7.1; //mm
cap_width = 12.4; //mm
cap_height = 4.1; //mm
offset = 4; //mm
thickness = 1.5; //mm
length = 11; //mm
stem_width = 7.2; //mm
stem_offset = 5;

$fn=24;

overall_height = cap_height + offset + plug_height + 2 * thickness;

difference() {
  cube([
        max(plug_width, cap_width) + 2 * thickness,
        length,
        overall_height],
       center = true);
  translate([0, 0, (overall_height - cap_height) / 2 - thickness]) {
    cube([cap_width, length + 0.01, cap_height], center = true);
  }
  translate([0, 0, -1 * (overall_height - plug_height) / 2 + thickness]) {
    cube([plug_width, length + 0.01, plug_height], center = true);
  }
  translate([0, (length - stem_width) / 2 - stem_offset, -1 * (overall_height - thickness) / 2]) {
    cylinder(d = stem_width, h = thickness + 0.01, center = true);
  }
}
