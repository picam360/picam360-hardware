include <../lib/Getriebe.scad>;
include <params.scad>

$fn=100;

module rotor_pitch_gear() {
    margin = 0.4;
    inner_thread_diameter = 15+margin;
    thread_diameter = 18;
    gear_height = 3;
    height = 6;
    gear_num = 23;
    gear_act = 2.23995;
    num=YAW_GEAR_RATIO*YAW_PINION_NUM;
    r=YAW_GEAR_RATIO*YAW_GEAR_DISTANCE/(YAW_GEAR_RATIO+1);
    echo(r=r);
    difference() {
        union() {
            translate([0, 0, -12-height/2+3])
            cylinder(r=thread_diameter/2,h=height,center=true);
            translate([0, 0, -12])
            kegelrad(modul=2*(12-(3-gear_act))/gear_num, zahnzahl=gear_num,  teilkegelwinkel=45, zahnbreite=3, bohrung=4, eingriffswinkel=20, schraegungswinkel=0);
            
            translate([0, 0, -12-gear_height])
            stirnrad (modul=r/num, zahnzahl=num, hoehe=gear_height, bohrung=0, eingriffswinkel=20, schraegungswinkel=0);

            difference() {
                radius=15.9;
                sphere(r=radius+3/2);
                sphere(r=radius+margin/2);
                translate([0, 0, 100/2-7])
                cube([100,100,100], center=true);
                translate([0, 0, -100/2-12.1])
                cube([100,100,100], center=true);
            }
        }
        cylinder(r=inner_thread_diameter/2,h=100,center=true);
        translate([0, 0, -12+gear_act+0.01])
        cylinder(r=inner_thread_diameter/2+5,h=100);
    }
}
rotor_pitch_gear();