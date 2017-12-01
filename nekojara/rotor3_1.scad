include <../lib/Getriebe.scad>;

$fn=100;

module rotor3_1() {
    margin = 0.4;
    inner_thread_diameter = 8+margin;
    thread_diameter = 12;
    difference() {
        union(){
            translate([35/2+15, 0, 0])
            rotate([0, 90, 0])
            cylinder(r=thread_diameter/2,h=35,center=true);
            translate([10+5, 0, 0])
            rotate([0, -90, 0])
            kegelrad(modul=1, zahnzahl=29,  teilkegelwinkel=45, zahnbreite=5, bohrung=4, eingriffswinkel=20, schraegungswinkel=0);
            
            difference() {
                sphere(r=20.5);
                translate([-100/2+15, 0, 0])
                cube([100,100,100], center=true);
            }
        }
            translate([50/2+7, 0, 0])
            rotate([0, 90, 0])
        cylinder(r=inner_thread_diameter/2,h=1000,center=true);
        
            translate([50-5, 0, 0])
            rotate([90, 0, 0])
        scale([1.5,1])
        cylinder(r=3/2,h=1000,center=true);
        
                translate([-100/2+15-3.70809, 0, 0])
                cube([100,100,100], center=true);
    }
}
rotor3_1();
