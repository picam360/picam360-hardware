include <../lib/Getriebe.scad>;

module motor_gear(gear_height=3) {
    difference() {
        stirnrad (modul=1.5, zahnzahl=10, hoehe=gear_height, bohrung=0, eingriffswinkel=20, schraegungswinkel=0);
        cylinder(r=6/2,h=100,center=true);
    }
  translate([-5/2,2.1,0])
    cube([5,1.2,gear_height]);
}

motor_gear();