include <../lib/Getriebe.scad>;

$fn=100;

module rotor1_2() {
    margin = 0.2;
    thread_diameter = 17 + margin;
    gear_height = 3;
    height = 5;
    difference() {
        union(){
            translate([0, 0, height/2])
            cylinder(r=thread_diameter/2+2,h=height,center=true);
            translate([0, 0, height-gear_height])
            stirnrad (modul=1.5, zahnzahl=34, hoehe=gear_height, bohrung=0, eingriffswinkel=20, schraegungswinkel=0);
        }
        cylinder(r=thread_diameter/2,h=100,center=true, $fn=8);
    }
}
rotor1_2();
