include <../lib/Getriebe.scad>;
include <params.scad>
use <motor_gear.scad>

$fn=100;

module rotor_yaw_gear() {
    margin = 0.3;
    thread_diameter = 15 + margin;
    gear_height = 3;
    height = 3;
    num=YAW_GEAR_RATIO*YAW_PINION_NUM;
    dia=YAW_GEAR_RATIO*YAW_GEAR_DISTANCE/(YAW_GEAR_RATIO+1);
    echo(dia=dia);
    difference() {
        union(){
            translate([0, 0, height/2])
            cylinder(r=thread_diameter/2+2,h=height,center=true);
            translate([0, 0, height-gear_height])
            stirnrad (modul=dia/num, zahnzahl=num, hoehe=gear_height, bohrung=0, eingriffswinkel=20, schraegungswinkel=0);
        }
        cylinder(r=thread_diameter/2,h=100,center=true, $fn=8);
        
        translate([0, 0, 1.5])
        difference(){
            cylinder(r=20,h=100);
            cylinder(r=thread_diameter/2+2,h=100, $fn=8);
        }
    }
}
if(0){
    translate([0, YAW_GEAR_DISTANCE/2, 0])
    motor_gear();
}
rotor_yaw_gear();
