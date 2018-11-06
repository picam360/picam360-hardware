include<params.scad>
use<../tools.scad>
use <../lib/ISOThread.scad>;

module oring_holder()
{
    t=0.2;
    inner_margin = 0;
    outer_space = 1;
    thread_h=6+2;//2mm acliric plate
    thread_margin = 0.5;
    thread_r_margin = 1;
    upper_thick = 2;
    difference(){
        union(){
            intersection()
            {
                translate([0, 0, upper_thick/2])
                cylinder(r=CHAMBER_DIA/2+1+thread_r_margin,h=upper_thick,center=true);
                translate([0, 0, -3.5])
                scale([1,1,0.25])
                sphere(r=DOME_DIA/1.45+thread_r_margin);
            }
            translate([0, 0, -(thread_h-thread_margin)])
            difference(){
                translate([0, 0, (thread_h-thread_margin)/2])
                cylinder(r=CHAMBER_DIA/2+outer_space+thread_r_margin ,h=(thread_h-thread_margin),center=true);
                translate([0,0,-0.005])
                iso_thread(m=DOME_DIA+(ORING_DIA+CHAMBER_THICK+THREAD_MALE_THICK+thread_r_margin)*2, l=(thread_h-thread_margin)+0.01, p=3, t=t);
            }
        }
        for(i=[0:31])
        rotate(i*360/32)
        translate([CHAMBER_DIA/2+5+thread_r_margin, 0, 0])
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