include<params.scad>
use<../tools.scad>
use<../lib/arc.scad>

aisle_enter=4;
aisle_outer=6;
aisle_len=13.4;
module main_chamber()
{
    taper=0;
    difference(){
        union(){
            for(i=[0:1])
            {            
                mirror([0,0,i])
            translate([0, 0, 11/2+(5-SHELL_THICK)/2])
                cylinder(r1=DOME_DIA/2+10, r2=DOME_DIA/2+ORING_DIA+SHELL_THICK+1,h=5-SHELL_THICK,center=true);
            }
            cylinder(r=DOME_DIA/2+10,h=11,center=true);
        }
        cylinder(r=DOME_DIA/2-3,h=21.01,center=true);
        for(i=[0:1])
        {            
            mirror([0,0,i])
            translate([0, 0, 5/2+(11-SHELL_THICK*2)/2])
            cylinder(r1=DOME_DIA/2+ORING_DIA+SHELL_THICK-taper,r2=DOME_DIA/2+ORING_DIA+SHELL_THICK,h=5.01,center=true);
        }
        
        nut_len=7;
        for(a=[0:3])
        {
            for(i=[0,1,3,4,5,7])
            rotate([0,0,i*360/32+a*90])
            translate([0, DOME_DIA/2-3-0.2, 0])
            aisle(enter_r=aisle_enter/2, exit_r=aisle_outer/2, length=aisle_len);
            
            for(i=[2,6])
            rotate([0,0,i*360/32+a*90])
            translate([0, DOME_DIA/2-3-10/2+5, 0])
            rotate([90,0])
            cylinder(r=1.7/2,h=10,center=true);
        }
    }
    for(i=[0:7])
    {
        rotate([0,0,i*360/8+22.5])
        linear_extrude(height=21-SHELL_THICK*2,center=true)
        arc(DOME_DIA/2+10-(5-SHELL_THICK)+0.01,5-SHELL_THICK,15-2*SHELL_MARGIN/((DOME_DIA/2+10)*3.14)*180);
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
if(false){
    intersection(){
        rotate(32)
        main_chamber();
        translate([0,0,200/2])
        translate([0,200/2,0])
        cube([200,200,200], center=true);
    }
}else{
    main_chamber();
}