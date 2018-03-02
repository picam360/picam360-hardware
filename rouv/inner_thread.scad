include<params.scad>
use<../tools.scad>
use <../lib/ISOThread.scad>;
use<main_chamber.scad>

angle=45;
angle2=30;

thread_h=7;
margin=0.2;//gosa and sealing coting
shell_thick=1.8-margin;
aisle_enter=4;
aisle_outer=6;
module inner_thread(aisle=true, angle=0, angle2=60)
{
    difference(){
        intersection(){
            union(){
                translate([0, 0, 7/2+thread_h/2])
                _inner_thread([0,0,angle]);
                difference(){
                    cylinder(r=CHAMBER_DIA/2,h=7,center=true);
                    cylinder(r=DOME_DIA/2+ORING_DIA+CHAMBER_THICK+margin,h=100,center=true);
                }
                translate([0, 0, -7/2-thread_h/2+0.01])
                _inner_thread([180,0,angle]);
            }
            rotate([0,0,(90-angle2)/2])
            rotate_extrude(angle=angle2){
                translate([0,-100/2])
                square([100,100]);
            }
        }
        for(i=[27:29])
        rotate([0,0,i*360/32])
        translate([0, DOME_DIA/2-3-0.2, 0.01])
        minkowski()
        {
            rotate([0,0,(28-i)*360/32])
            translate([0,-10/2,0])
            cube([0.01,10,0.01], center=true);
            aisle(enter_r=aisle_enter/2, exit_r=aisle_outer/2, length=15.2);
        }
        if(aisle){
            for(i=[27:29])
            rotate([0,0,i*360/32])
            translate([0,100/2,0])
            rotate([90,0,0])
            cylinder(r=aisle_enter/2,h=100,center=true);
        }
        
        rotate(-45-22.5)
        translate([0, DOME_DIA/2+ORING_DIA+CHAMBER_THICK+5/2-2, 0.01])
        rotate([90,0,0])
        linear_extrude(height=5)
        text(str(angle), size=4, halign="center", valign="center", font = "Liberation Sans");
    }
}
module _inner_thread(rotation=[0,0,0])
{
    rotate(rotation)
    difference()
    {
        translate([0, 0, -thread_h/2])
        iso_thread(m=DOME_DIA+(ORING_DIA+CHAMBER_THICK+THREAD_MALE_THICK)*2, l=thread_h, p=3, t=0.0);
        translate([0, 0, -100/2-thread_h/2+(thread_h-shell_thick)])
        cylinder(r=DOME_DIA/2+ORING_DIA+CHAMBER_THICK+margin,h=100,center=true);
        cylinder(r=DOME_DIA/2+ORING_DIA+shell_thick+margin,h=100,center=true);
    }
}
module aisle(enter_r=3/2, exit_r=5/2, length=11){
    translate([0,length/2,0])
    rotate([90,0,0])
    cylinder(r1=exit_r, r2=enter_r,h=length,center=true);
}
module insert_nut(m=6/2, enter_h=9, exit_h=9, joint=2){
    translate([0,enter_h/2-0.01,0])
    rotate([90,0])
    cylinder(r=m,h=enter_h,center=true,$fn=6);
}

$fn=180;
if(false)
{
    intersection(){
        rotate(135)
        union(){
            inner_thread(angle=0);
            main_chamber();
        }
    //    translate([0,0,200/2])
        translate([0,200/2,0])
        cube([200,200,200], center=true);
    }
}else{
    inner_thread(angle=angle,angle2=angle2);
}