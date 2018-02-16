include<../params.scad>
use<../tools.scad>
use <../lib/ISOThread.scad>;

module oring_holder()
{
    margin = 0.6;
    difference(){
        union(){
            intersection()
            {
                translate([0, 0, 3/2])
                cylinder(r=DOME_DIA/2+5+5+3+2,h=3,center=true);
                translate([0, 0, -3.5])
                scale([1,1,0.25])
                sphere(r=DOME_DIA/1.5);
            }
            translate([0, 0, -7])
            difference(){
                translate([0, 0, 7/2])
                cylinder(r=DOME_DIA/2+5+5+3+2,h=7,center=true);
                translate([0,0,-0.005])
                iso_thread(m=DOME_DIA+(5+5+3)*2, l=7.01, p=3, t=0.2);
            }
        }
        cylinder(r=DOME_DIA/2+margin,h=100,center=true);
    }
}
       
$fn=360; 
//intersection(){
////    rotate([0,0,20])
    oring_holder();
//    translate([0,0,200/2])
//    translate([0,200/2,0])
//    cube([200,200,200], center=true);
//}