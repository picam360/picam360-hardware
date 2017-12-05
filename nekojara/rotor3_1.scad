include <../lib/Getriebe.scad>;

$fn=100;

module rotor3_1() {
    margin = 0.4;
    inner_thread_diameter = 8+margin;
    thread_diameter = 12;
    difference() {
        union(){
            translate([35/2+12, 0, 0])
            rotate([0, 90, 0])
            cylinder(r=thread_diameter/2,h=35,center=true);
            translate([10+2, 0, 0])
            rotate([0, -90, 0])
            kegelrad(modul=1, zahnzahl=22,  teilkegelwinkel=45, zahnbreite=3, bohrung=4, eingriffswinkel=20, schraegungswinkel=0);
            
            difference() {
                sphere(r=15.75);
                translate([-100/2+12, 0, 0])
                cube([100,100,100], center=true);
            }
        }
            translate([50/2+7, 0, 0])
            rotate([0, 90, 0])
        cylinder(r=inner_thread_diameter/2,h=1000,center=true);
        
            translate([50-8, 0, 0])
            rotate([90, 0, 0])
        scale([1.5,1])
        cylinder(r=3/2,h=1000,center=true);
        
                translate([-100/2+12-2.22731, 0, 0])
                cube([100,100,100], center=true);
    }
}
rotor3_1();
