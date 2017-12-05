include <../lib/Getriebe.scad>;

$fn=100;

module rotor2() {
    margin = 0.4;
    inner_thread_diameter = 15+margin;
    thread_diameter = 18;
    gear_height = 3;
    height = 7;
    difference() {
        union() {
            translate([0, 0, -12-height/2+4])
            cylinder(r=thread_diameter/2,h=height,center=true);
            translate([0, 0, -12])
            kegelrad(modul=1, zahnzahl=22,  teilkegelwinkel=45, zahnbreite=3, bohrung=4, eingriffswinkel=20, schraegungswinkel=0);
            
            translate([0, 0, -12-gear_height])
            stirnrad (modul=1.5, zahnzahl=34, hoehe=gear_height, bohrung=0, eingriffswinkel=20, schraegungswinkel=0);

            difference() {
                radius=15.75;
                sphere(r=radius+3/2);
                sphere(r=radius+margin/2);
                translate([0, 0, 100/2-6])
                cube([100,100,100], center=true);
                translate([0, 0, -100/2-12.1])
                cube([100,100,100], center=true);
            }
        }
        cylinder(r=inner_thread_diameter/2,h=100,center=true);
    }
}
rotor2();