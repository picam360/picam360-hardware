include<params.scad>
use<../tools.scad>

module main_chamber()
{
    difference(){
        cylinder(r=DOME_DIA/2+10,h=21,center=true);
        cylinder(r=DOME_DIA/2-3,h=21.01,center=true);
        for(i=[0:1])
        {            
            mirror([0,0,i])
            translate([0, 0, 10/2+11/2])
            cylinder(r=DOME_DIA/2+ORING_DIA-0.2,h=10,center=true);
        }
        
        for(a=[0:3])
        {
            for(i=[0,1,3,4,5,7])
            rotate([0,0,i*360/32+a*90])
            translate([0, DOME_DIA/2-3-0.05, 0.01])
            aisle(enter_r=3.5/2, exit_r=5/2, enter_h=5.5, exit_h=6.5, joint=2);
            for(i=[2,6])
            rotate([0,0,i*360/32+a*90])
            translate([0, DOME_DIA/2-4, 0.01])
            insert_nut(m=6/2, enter_h=5, exit_h=5, joint=5);
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
    translate([0,enter_h+joint+exit_h/2-0.2,0])
    rotate([90,30])
    cylinder(r=exit_r,h=exit_h,center=true);
}
module insert_nut(m=6/2, enter_h=9, exit_h=9, joint=2){
    translate([0,enter_h/2-0.01,0])
    rotate([90,0])
    cylinder(r=m,h=enter_h,center=true,$fn=6);
    translate([0,enter_h+joint+exit_h/2-0.2,0])
    rotate([90,0])
    cylinder(r=m,h=exit_h,center=true,$fn=6);
}

$fn=360;
if(false){
    intersection(){
        main_chamber();
        translate([0,0,200/2])
    //    translate([0,200/2,0])
        cube([200,200,200], center=true);
    }
}else{
    main_chamber();
}