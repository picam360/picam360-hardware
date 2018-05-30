include <../lib/Getriebe.scad>;

$fn=100;

module arm_shaft() {
    margin = 0.4;
    inner_thread_diameter = 12+margin;
    gear_act = 2.23995;
    gear_edge = 12-gear_act;
    difference() {
        union() {
            translate([27/2+gear_edge, 0, 0])
            rotate([0, 90, 0])
            cylinder(r=8/2,h=27,center=true);
            translate([gear_edge/2, 0, 0])
            rotate([0, 90, 0])
            cylinder(r2=6/2,r1=5/2,h=gear_edge,center=true);
        }
        cylinder(r=inner_thread_diameter/2,h=100,center=true);
        
            translate([100/2, 0, 0])
            rotate([0, 90, 0])
            cylinder(r=3/2,h=100,center=true);
    }
}
rotate([90,90])
arm_shaft();
