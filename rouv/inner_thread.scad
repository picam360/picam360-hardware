include<params.scad>
use<../tools.scad>
use <../lib/ISOThread.scad>;
use<../lib/arc.scad>
use<main_chamber.scad>

angle=45;
angle2=30;

h=9;
margin=0.2;
thread_h=6;
module inner_thread(aisle=true, angle=0, angle2=60)
{
    difference()
    {
        intersection(){
            union(){
                translate([0, 0, h/2+thread_h/2])
                rotate([0,0,angle])
                translate([0, 0, -thread_h/2])
                iso_thread(m=DOME_DIA+(ORING_DIA+CHAMBER_THICK+THREAD_MALE_THICK)*2, l=thread_h, p=3, t=0.0);
                
                cylinder(r=CHAMBER_DIA/2,h=h,center=true);
                
                translate([0, 0, -h/2-thread_h/2+0.01])
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
                translate([0, 0, 11/2+(5-SHELL_THICK+SHELL_MARGIN)/2])
                cylinder(r1=DOME_DIA/2+10+SHELL_MARGIN, r2=DOME_DIA/2+ORING_DIA+SHELL_THICK+1+SHELL_MARGIN-0.25,h=5-SHELL_THICK+SHELL_MARGIN,center=true);
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
        if(aisle){
            for(i=[27:29])
            rotate([0,0,i*360/32])
            translate([0,100/2,0])
            rotate([90,0,0])
            cylinder(r=5/2,h=100,center=true);
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
module inner_thread_2(aisle=true, angle=0, angle2=60)
{
    difference()
    {
        union()
        {
            inner_thread(aisle=aisle,angle=angle,angle2=angle2);
            for(i=[-1,1])
            rotate(45+i*(15+12/2))
            linear_extrude(height=7,center=true)
            arc(CHAMBER_DIA/2-6+SHELL_MARGIN,4-SHELL_MARGIN,12);
        }
        for(i=[-1,1])
        rotate(-45+i*(15+15/2))
        translate([0,CHAMBER_DIA/2-6-10/2+2,0])
        rotate([90,0])
        cylinder(r=1.7/2,h=100,center=true);
    }
}
module inner_thread_3(aisle=true, angle=0, angle2=60, bolt_base=true)
{
    difference()
    {
        union()
        {
            inner_thread(aisle=aisle,angle=angle,angle2=angle2);
            if(bolt_base)
            {
                for(i=[-1,1])
                rotate(-45+i*(15+15/2))
                translate([0,CHAMBER_DIA/2-2/2+0.5,0])
                rotate([90,0])
                cylinder(r=4/2,h=2,center=true);
            }
        }
        for(i=[-1,1])
        rotate(45+i*(15+15-12.1/2+0.001))
        linear_extrude(height=6+margin*2,center=true)
        arc(CHAMBER_DIA/2-6+SHELL_MARGIN,4-SHELL_MARGIN+margin,12.25);
            
        for(i=[-1,1])
        rotate(-45+i*(15+15/2))
        translate([0,CHAMBER_DIA/2+10/2-1,0])
        rotate([90,0])
        cylinder(r=2.4/2,h=100,center=true);
    }
}

$fn=180;
if(false)
{
    intersection()
    {
        rotate(152)
        union(){
            rotate(-45)
            inner_thread_2(angle=angle,angle2=30);
            inner_thread_3(angle=angle,angle2=60);
            main_chamber();
        }
        translate([0,0,200/2])
        //translate([0,200/2,0])
        cube([200,200,200], center=true);
    }
}else{
    if(angle2==30){
        inner_thread_2(angle=angle,angle2=angle2);
    }else{
        inner_thread_3(angle=angle,angle2=angle2);
    }
}