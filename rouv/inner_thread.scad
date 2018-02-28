include<params.scad>
use<../tools.scad>
use <../lib/ISOThread.scad>;

angle=0;

module inner_thread(aisle=true, angle=0)
{
    margin = 0.3;//gosa and sealing coting
    difference(){
        intersection(){
            union(){
                translate([0, 0, 7])
                _inner_thread([0,0,angle]);
                difference(){
                    cylinder(r=CHAMBER_DIA/2,h=7,center=true);
                    cylinder(r=DOME_DIA/2+ORING_DIA+CHAMBER_THICK+margin,h=100,center=true);
                }
                translate([0, 0, -7+0.01])
                _inner_thread([180,0,angle]);
            }
            rotate([0,0,30/2])
            rotate_extrude(angle=60){
                translate([0,-20/2])
                square([100,20]);
            }
        }
        if(aisle){
            for(i=[27:29])
            rotate([0,0,i*360/32])
            translate([0, DOME_DIA/2+ORING_DIA+CHAMBER_THICK+5/2, 0.01])
            rotate([90,0,0])
            cylinder(r=3.5/2,h=10,center=true);
        }
        nut_len=7;
        
        for(i=[26,30])
        rotate([0,0,i*360/32])
        translate([0, DOME_DIA/2-nut_len+1, 0.01])
        minkowski()
        {
            rotate([0,0,(28-i)*360/32])
            translate([0,-10/2,0])
            cube([0.01,10,0.01], center=true);
            insert_nut(m=6/2, enter_h=nut_len, exit_h=nut_len, joint=5);
        }
        
        for(i=[26,30])
        rotate([0,0,i*360/32])
        translate([0, DOME_DIA/2+ORING_DIA+CHAMBER_THICK+nut_len-2.5, 0.01])
        rotate([90,0,0])
        union(){
            translate([0, 0, 10/2-0.01])
            cylinder(r=2.7/2,h=10,center=true);
            translate([0, 0, -10/2])
            cylinder(r=4.6/2,h=10,center=true);
        }
        rotate(-45-11.25/2)
        translate([0, DOME_DIA/2+ORING_DIA+CHAMBER_THICK+5/2-2, 0.01])
        rotate([90,0,0])
        linear_extrude(height=5)
        text(str(angle), size=4, halign="center", valign="center", font = "Liberation Sans");
    }
}
module _inner_thread(rotation=[0,0,0])
{
    margin = 0.2;
    difference()
    {
        rotate(rotation)
        translate([0, 0, -7/2])
        iso_thread(m=DOME_DIA+(ORING_DIA+CHAMBER_THICK+THREAD_MALE_THICK)*2, l=7, p=3, t=0.0);
        cylinder(r=DOME_DIA/2+ORING_DIA+CHAMBER_THICK+margin,h=100,center=true);
    }
}
module insert_nut(m=6/2, enter_h=9, exit_h=9, joint=2){
    translate([0,enter_h/2-0.01,0])
    rotate([90,0])
    cylinder(r=m,h=enter_h,center=true,$fn=6);
    translate([0,enter_h+joint+exit_h/2-0.2,0])
    rotate([90,0])
    cylinder(r=m,h=exit_h,center=true,$fn=6);
}

$fn=180;
if(false)
{
    intersection(){
    //    rotate([0,0,20])
        inner_thread(angle=0);
        translate([0,0,200/2])
    //    translate([0,200/2,0])
        cube([200,200,200], center=true);
    }
}else{
    inner_thread(angle=angle);
}