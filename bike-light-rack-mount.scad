light_tab_width = 18.0; //mm
light_tab_thickness = 2.2; //mm
light_stub_width = 13.5; //mm
light_mount_thickness = 2; //mm

rack_tab_width = 22; //mm
rack_tab_height = light_tab_width + 2 * light_mount_thickness;
rack_mount_thickness = 2; //mm
rack_tab_thickness = 1.7; //mm

module light_mount() {
  difference() {
    // main body
    cube([
        light_tab_width + 2 * light_mount_thickness,
        light_tab_width + 2 * light_mount_thickness,
        light_tab_thickness + 2 * light_mount_thickness],
      center = true);

    // stub cutout
    translate([light_stub_width/2,0, light_mount_thickness]) {
      cube([
            2 * light_stub_width,
            light_stub_width,
            light_tab_thickness + 2 * light_mount_thickness],
          center = true);
    }

    translate([light_tab_width/2,0, 0]) {
      cube([
            2 * light_tab_width,
            light_tab_width,
            light_tab_thickness],
          center = true);
    }
  }
}

module rack_mount() {
  difference() {
    cube([
          rack_tab_height,
          rack_tab_width + 2 * rack_mount_thickness,
          rack_tab_thickness + 2 * rack_mount_thickness],
        center=true);
    cube([
          rack_tab_height + 0.1,
          rack_tab_width,
          rack_tab_thickness],
         center=true);
  }
}

union() {
  light_mount();
  translate([
             0,
             0,
             -light_tab_thickness/2 - light_mount_thickness
             - rack_tab_thickness/2]) {
    rack_mount();
  }
}
