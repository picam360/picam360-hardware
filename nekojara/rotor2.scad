include <../lib/Getriebe.scad>;

$fn=100;

module rotor2() {
    margin = 0.4;
    inner_thread_diameter = 17+margin;
    thread_diameter = 21;
    gear_height = 3;
    height = 12;
    difference() {
        union() {
            translate([0, 0, -13])
            cylinder(r=thread_diameter/2,h=height,center=true);
            translate([0, 0, -15])
            kegelrad(modul=1, zahnzahl=28,  teilkegelwinkel=45, zahnbreite=5, bohrung=4, eingriffswinkel=20, schraegungswinkel=0);
            
            translate([0, 0, -15-gear_height])
            stirnrad (modul=1.5, zahnzahl=34, hoehe=gear_height, bohrung=0, eingriffswinkel=20, schraegungswinkel=0);

            difference() {
                sphere(r=22);
                sphere(r=20+margin/2);
                translate([0, 0, 100/2-10])
                cube([100,100,100], center=true);
                translate([0, 0, -100/2-18])
                cube([100,100,100], center=true);
            }
        }
        cylinder(r=inner_thread_diameter/2,h=100,center=true);
    }
}
rotor2();