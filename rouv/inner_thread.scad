include<params.scad>
use<../tools.scad>
use <../lib/ISOThread.scad>;
use<../lib/arc.scad>
use<main_chamber.scad>

angle=45;
angle2=30;

thread_h=7;
aisle_enter=3.5;
aisle_outer=aisle_enter*sqrt(3);
module inner_thread(aisle=true, angle=0, angle2=60)
{
    difference()
    {
        intersection(){
            union(){
                translate([0, 0, 7/2+thread_h/2])
                rotate([0,0,angle])
                translate([0, 0, -thread_h/2])
                iso_thread(m=DOME_DIA+(ORING_DIA+CHAMBER_THICK+THREAD_MALE_THICK)*2, l=thread_h, p=3, t=0.0);
                
                cylinder(r=CHAMBER_DIA/2,h=7,center=true);
                
                translate([0, 0, -7/2-thread_h/2+0.01])
                rotate([180,0,angle])
                translate([0, 0, -thread_h/2])
                iso_thread(m=DOME_DIA+(ORING_DIA+CHAMBER_THICK+THREAD_MALE_THICK)*2, l=thread_h, p=3, t=0.0);
            }
            rotate([0,0,(90-angle2)/2])
            rotate_extrude(angle=angle2){
                translate([0,-100/2])
                square([100,100]);
            }
        }
        union(){
            for(i=[0:1])
            {            
                mirror([0,0,i])
                translate([0, 0, 11/2+(5-SHELL_THICK+0.4)/2])
                cylinder(r1=DOME_DIA/2+10+SHELL_MARGIN, r2=DOME_DIA/2+ORING_DIA+SHELL_THICK+1+SHELL_MARGIN-0.25,h=5-SHELL_THICK+0.4,center=true);
            }
            cylinder(r=DOME_DIA/2+10+SHELL_MARGIN,h=11,center=true);
            cylinder(r=DOME_DIA/2+5+SHELL_THICK,h=100,center=true);
        }
        for(i=[0:1])
        {
            rotate([0,0,i*360/8+22.5])
            linear_extrude(height=21-SHELL_THICK*2+SHELL_MARGIN*2,center=true)
            arc(DOME_DIA/2+10-(5-SHELL_THICK)+0.01,5-SHELL_THICK+SHELL_MARGIN,15);
        }
//        for(i=[27:29])
//        rotate([0,0,i*360/32])
//        translate([0, DOME_DIA/2-3-0.2, 0.01])
//        minkowski()
//        {
//            rotate([0,0,(28-i)*360/32])
//            translate([0,-10/2,0])
//            cube([0.01,10,0.01], center=true);
//            aisle(enter_r=aisle_enter/2, exit_r=aisle_outer/2, length=15.2);
//        }
        if(aisle){
            for(i=[27:29])
            rotate([0,0,i*360/32])
            translate([0,100/2,0])
            rotate([90,0,0])
            cylinder(r=(angle==45&&i==27)?4/2:aisle_enter/2,h=100,center=true);
        }
        
        rotate(-45-5.5)
        translate([0, DOME_DIA/2+ORING_DIA+CHAMBER_THICK+5/2-2, 0])
        rotate([90,0,0])
        linear_extrude(height=5)
        text(str(angle), size=4, halign="center", valign="center", font = "Liberation Sans");
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