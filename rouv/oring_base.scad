include<params.scad>
use<../tools.scad>
use<main_chamber.scad>

module oring_base()
{
    taper=0;
    difference(){
        translate([0, 0, -(ORING_DIA+SHELL_THICK-SHELL_MARGIN)/2+21/2])
        cylinder(r1=DOME_DIA/2+ORING_DIA+SHELL_THICK-SHELL_MARGIN-taper,r2=DOME_DIA/2+ORING_DIA+SHELL_THICK-SHELL_MARGIN,h=ORING_DIA+SHELL_THICK-SHELL_MARGIN,center=true);
        cylinder(r=DOME_DIA/2-3,h=21.01,center=true);
        translate([0, 0, 10/2+21/2-ORING_DIA])
        cylinder(r=DOME_DIA/2+ORING_DIA,h=10,center=true);
    }
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