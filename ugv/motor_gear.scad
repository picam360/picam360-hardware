include <../lib/Getriebe.scad>;
include <params.scad>

module motor_gear(gear_height=3,bore=5) {
    num=YAW_PINION_NUM;
    dia=YAW_GEAR_DISTANCE/(YAW_GEAR_RATIO+1);
    echo(dia=dia);
    difference() {
        union(){
            stirnrad (modul=dia/num, zahnzahl=num, hoehe=gear_height, bohrung=0, eingriffswinkel=20, schraegungswinkel=0);
            cylinder(r=(1 - 7/3/num)*dia/2,h=bore);
        }
        cylinder(r=6/2,h=100,center=true);
    }
    intersection(){
        cylinder(r=7/2,h=100,center=true);
        translate([-5/2,2.1,0])
        cube([5,1.2,bore]);
    }
}

motor_gear();