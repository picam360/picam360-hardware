include <../lib/Getriebe.scad>;

$fn=100;

module rotor1_1() {
    margin = 0.4;
    inner_thread_diameter = 13+margin;
    thread_diameter = 17;
    thread_height = 30;
    gear_height = 3;
    difference() {
        union() {
            translate([0, 0, (thread_height-4)/2+4])
            cylinder(r=thread_diameter/2,h=thread_height-4,center=true);
            translate([0, 0, 4/2])
            cylinder(r=thread_diameter/2,h=4,center=true, $fn=8);
            
            translate([10/2+5-3.71409, 0, 23])
            rotate([0, 90, 0])
            cylinder(r=8/2+2,h=10,center=true);
        }
        cylinder(r=inner_thread_diameter/2,h=100,center=true);
        
        translate([100/2, 0, 23])
        rotate([0, 90, 0])
        cylinder(r=6/2,h=100,center=true);
    }
}
rotor1_1();
