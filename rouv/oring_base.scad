include<params.scad>
use<../tools.scad>
use<main_chamber.scad>

margin=0.2;
shell_thick=1.8-margin;
module oring_base()
{
    difference(){
        translate([0, 0, -(ORING_DIA+shell_thick)/2+21/2])
        cylinder(r=DOME_DIA/2+ORING_DIA+shell_thick,h=ORING_DIA+shell_thick,center=true);
        cylinder(r=DOME_DIA/2-3,h=21.01,center=true);
        translate([0, 0, 10/2+21/2-ORING_DIA])
        cylinder(r=DOME_DIA/2+ORING_DIA,h=10,center=true);
    }
}
module aisle(enter_r=2/2, exit_r=3/2, enter_h=9, exit_h=9, joint=2){
    translate([0,enter_h/2,0])
    rotate([90])
    cylinder(r=enter_r,h=enter_h,center=true);
    translate([0,enter_h+joint/2-0.01,0])
    rotate([90,30])
    cylinder(r1=exit_r, r2=enter_r,h=joint,center=true);
    translate([0,enter_h+joint+exit_h/2-0.2,0])
    rotate([90,30])
    cylinder(r=exit_r,h=exit_h,center=true);
}
module insert_nut(m=6/2, enter_h=9, exit_h=9, joint=2){
    translate([0,enter_h/2-0.01,0])
    rotate([90,0])
    cylinder(r=m,h=enter_h,center=true,$fn=6);
}

$fn=360;
if(false){
    intersection()
    {
        union(){
            oring_base();
            main_chamber();
        }
        //translate([0,0,200/2])
        translate([0,200/2,0])
        cube([200,200,200], center=true);
    }
}else{
    oring_base();
}