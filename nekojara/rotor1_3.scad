include <../lib/MCAD/involute_gears.scad>;
include <../lib/Getriebe.scad>;

$fn=100;

module rotor1_3() {
    margin = 0.6;
    inner_thread_diameter = 13+margin;
    difference() {
        union() {
            translate([20/2+15-3.70809, 0, 23])
            rotate([0, 90, 0])
            cylinder(r=8/2,h=20,center=true);
            translate([(15-3.70809)/2, 0, 23])
            rotate([0, 90, 0])
            cylinder(r2=6/2,r1=5/2,h=15-3.70809,center=true);
        }
        cylinder(r=inner_thread_diameter/2,h=100,center=true);
        
            translate([100/2, 0, 23])
            rotate([0, 90, 0])
            cylinder(r=3/2,h=100,center=true);
    }
}
rotor1_3();
