include<params.scad>
use<../tools.scad>

type=1;

module aisle_mold(type=0)
{
    difference(){
        cylinder(r=DOME_DIA/2+12,h=7,center=true);
        cylinder(r=DOME_DIA/2-4,h=7.01,center=true);
        
        nut_len=7;
        for(a=[0:3])
        {
            for(i=[0,1,3,4,5,7])
            rotate([0,0,i*360/32+a*90])
            translate([0, DOME_DIA/2-3-0.05, 0.01])
            aisle(enter_r=3.7/2, exit_r=5.2/2, enter_h=5.5, exit_h=6.5, joint=2);
        }
        translate([0,0,200/2])
        cube([200,200,200],center=true);
        if(type==1)
        {
            for(a=[0:3])
            {
                for(i=[2,6])
                rotate([0,0,i*360/32+a*90])
                translate([0, DOME_DIA/2+4, 0.01])
                cylinder(r=5.2/2,h=5,center=true);
            }
        }
    }
    if(type==0)
    {
        for(a=[0:3])
        {
            for(i=[2,6])
            rotate([0,0,i*360/32+a*90])
            translate([0, DOME_DIA/2+4, 0.01])
            cylinder(r=5/2,h=5,center=true);
        }
    }
}
module aisle(enter_r=2/2, exit_r=3/2, enter_h=9, exit_h=9, joint=2){
    translate([0,enter_h/2,0])
    rotate([90])
    cylinder(r=enter_r,h=enter_h,center=true);
    translate([0,enter_h+joint/2-0.01,0])
    rotate([90,30])
    cylinder(r1=exit_r, r2=enter_r,h=joint,center=true);
    translate([0,enter_h+joint+exit_h/2-0.02,0])
    rotate([90,30])
    cylinder(r=exit_r,h=exit_h,center=true);
    rotate([90])
    cylinder(r=1/2,h=100,center=true);
}

$fn=180;

aisle_mold(type=type);