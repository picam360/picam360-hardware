include<params.scad>
use<../tools.scad>
use <../lib/ISOThread.scad>;

module oring_holder()
{
    margin = 0;
    difference(){
        union(){
            intersection()
            {
                translate([0, 0, 3/2])
                cylinder(r=CHAMBER_DIA/2+1,h=3,center=true);
                translate([0, 0, -3.5])
                scale([1,1,0.25])
                sphere(r=DOME_DIA/1.45);
            }
            translate([0, 0, -6])
            difference(){
                translate([0, 0, 6/2])
                cylinder(r=CHAMBER_DIA/2+1 ,h=6,center=true);
                translate([0,0,-0.005])
                iso_thread(m=DOME_DIA+(ORING_DIA+CHAMBER_THICK+THREAD_MALE_THICK)*2, l=6.01, p=3, t=0.3);
            }
        }
        cylinder(r=DOME_DIA/2+margin,h=100,center=true);
        for(i=[0:31])
        rotate(i*360/32)
        translate([CHAMBER_DIA/2+5, 0, 0])
        cylinder(r=5.5,h=100,center=true);
    }
}
       
$fn=180; 
//intersection(){
////    rotate([0,0,20])
    oring_holder();
//    translate([0,0,200/2])
//    translate([0,200/2,0])
//    cube([200,200,200], center=true);
//}