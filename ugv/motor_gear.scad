include <../lib/Getriebe.scad>;
include <params.scad>

module motor_gear(gear_height=3) {
    num=YAW_PINION_NUM;
    r=YAW_GEAR_DISTANCE/(YAW_GEAR_RATIO+1);
    echo(r=r);
    difference() {
        stirnrad (modul=r/num, zahnzahl=num, hoehe=gear_height, bohrung=0, eingriffswinkel=20, schraegungswinkel=10);
        cylinder(r=6/2,h=100,center=true);
    }
    intersection(){
        cylinder(r=7/2,h=100,center=true);
        translate([-5/2,2.1,0])
        cube([5,1.2,gear_height]);
    }
}

motor_gear();