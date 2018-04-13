include <../lib/Getriebe.scad>;
use <slipring.scad>;
$fn=100;

module rotor_yaw() {
    margin = 0.4;
    inner_thread_diameter = 12+margin;
    thread_diameter = 15;
    part1=16;
    part2=8+0.3;
    gear_height = 3;
    gear_act = 2.23995;
    thread_height = part1+part2+gear_height;
    difference() {
        union() {
            translate([0, 0, 0])
            cylinder(r=thread_diameter/2+0.5,h=thread_height-part2-gear_height,center=true);
            translate([0, 0, -part1/2-part2/2])
            cylinder(r=thread_diameter/2,h=part2,center=true);
            translate([0, 0, -part1/2-part2-gear_height/2])
            cylinder(r=thread_diameter/2,h=gear_height,center=true, $fn=8);
            
            for(i=[0,1,2,3]){
                rotate([0, 0, 90*i])
                translate([-10/2+12-gear_act, 0, 0])
                rotate([0, 90, 0])
                cylinder(r=8/2+2,h=10,center=true);
            }
            
            offset=0.5;
            l=[18,22];
            for(i=[0:1])
            {
                rotate(180*i)
                slipring(r=l[i]);
            }
        }
        translate([0, 0, 0])
        cylinder(r=inner_thread_diameter/2,h=100,center=true);
        
        for(i=[1,3]){
            rotate([0, 0, 90*i])
            translate([100/2, 0, 0])
            rotate([0, 90, 0])
            cylinder(r=6/2,h=100,center=true);
        }
    }
}
rotor_yaw();
