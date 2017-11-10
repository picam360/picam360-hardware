include <../lib/MCAD/involute_gears.scad>;

$fn=100;

module center_gear() {
    margin = 0.3;
    thread_diameter = 18+margin;
    gear_height = 5;
    gear (circular_pitch=270,
      gear_thickness = gear_height/2,
      rim_thickness = gear_height,
      hub_thickness = gear_height+7-margin,
      hub_diameter = 24,
      bore_diameter = thread_diameter,
      circles=4,
      number_of_teeth=32);
    difference() {
        union() {
            translate([0, 0, -5/2])
            cylinder(r=24/2,h=5,center=true);
            rotate([0, 0, 45])
            translate([50/2, 0, -5/2])
            rotate([0, 90, 0])
            difference() {
                cylinder(r=5/2,h=50,center=true);
                translate([0, 0, 50/2-3])
                rotate([90, 0, 0])
                cylinder(r=2/2,h=100,center=true);
            }
        }
        cylinder(r=thread_diameter/2,h=100,center=true);
    }
}
center_gear();
