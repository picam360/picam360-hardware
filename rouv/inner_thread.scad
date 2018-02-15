include<../params.scad>
use<../tools.scad>
use <../lib/ISOThread.scad>;

module inner_thread()
{
    margin = 0.2;
    difference(){
        intersection(){
            union(){
                translate([0, 0, 7])
                _inner_thread(dir=0);
                difference(){
                    cylinder(r=DOME_DIA/2+5+5+5,h=7,center=true);
                    cylinder(r=DOME_DIA/2+5+5+margin,h=100,center=true);
                }
                translate([0, 0, -7+0.01])
                _inner_thread(dir=1);
            }
            rotate([0,0,30/2])
            rotate_extrude(angle=60){
                translate([0,-20/2])
                square([100,20]);
            }
        }
        for(i=[27:29])
        rotate([0,0,i*360/32])
        translate([0, DOME_DIA/2+5+5+5/2, 0.01])
        cube([5+margin,10,3.3+margin],center=true);
        for(i=[26,30])
        rotate([0,0,i*360/32])
        translate([0, DOME_DIA/2+5+5+5/2, 0.01])
        rotate([90,0,0])
        union(){
            translate([0, 0, 10/2])
            cylinder(r=2.7/2,h=10,center=true);
            translate([0, 0, -10/2])
            cylinder(r=5/2,h=10,center=true);
        }
    }
}
module _inner_thread(dir=0)
{
    margin = 0.2;
    difference(){
        rotate([dir*180,0,0])
        translate([0, 0, -7/2])
        iso_thread(m=DOME_DIA+(5+5+3)*2, l=7, p=3, t=0.0);
        cylinder(r=DOME_DIA/2+5+5+margin,h=100,center=true);
    }
}
       
$fn=360; 
//intersection(){
////    rotate([0,0,20])
    inner_thread();
//    translate([0,0,200/2])
//    translate([0,200/2,0])
//    cube([200,200,200], center=true);
//}