include<params.scad>
use<../tools.scad>
use <../lib/ISOThread.scad>;
use<main_chamber.scad>

angle=0;
angle2=60;

thread_h=7;
margin = 0.1;//gosa and sealing coting
insert_thick=1-margin;
module aisle_insert(aisle=true, angle=0)
{
    difference(){
        translate([0, DOME_DIA/2-3-0.2, 0])
        aisle(enter_r=2/2+insert_thick, exit_r=4/2+insert_thick, length=15.2);
        translate([0, DOME_DIA/2-3-0.21, 0])
        aisle(enter_r=2/2, exit_r=4/2, length=15.22);
        translate([0,0,200/2])
        cube([200,200,200], center=true);        
    }
}
module aisle(enter_r=3/2, exit_r=5/2, length=11){
    translate([0,length/2,0])
    rotate([90,0,0])
    cylinder(r1=exit_r, r2=enter_r,h=length,center=true);
}
$fn=180;
if(false)
{
    intersection(){
        rotate(90)
        union(){
            aisle_insert(angle=0);
            main_chamber();
        }
    //    translate([0,0,200/2])
        translate([0,200/2,0])
        cube([200,200,200], center=true);
    }
}else{
    aisle_insert(angle=angle);
}