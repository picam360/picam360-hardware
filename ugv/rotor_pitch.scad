include <../lib/Getriebe.scad>;

$fn=100;

module rotor_pitch() {
    margin = 0.4;
    inner_thread_diameter = 8+margin;
    thread_diameter = 12;
    gear_num = 23;
    gear_act = 2.23995;
    difference() {
        union(){
            translate([gear_act+35/2, 0, 0])
            rotate([0, 90, 0])
            cylinder(r=thread_diameter/2,h=35,center=true);
            translate([10+2, 0, 0])
            rotate([0, -90, 0])
            kegelrad(modul=2*(12-(3-gear_act))/gear_num, zahnzahl=gear_num,  teilkegelwinkel=45, zahnbreite=3, bohrung=4, eingriffswinkel=20, schraegungswinkel=0);
            
            difference() {
                sphere(r=15.9);
                translate([-100/2+12, 0, 0])
                cube([100,100,100], center=true);
            }
        }
            translate([50/2+7, 0, 0])
            rotate([0, 90, 0])
        cylinder(r=inner_thread_diameter/2,h=1000,center=true);
        
        //for production
        translate([-100/2+12-gear_act, 0, 0])
                cube([100,100,100], center=true);
    }
}
rotor_pitch();
