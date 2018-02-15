include<../params.scad>
use<../tools.scad>

module main_chamber()
{
    difference(){
        cylinder(r=DOME_DIA/2+10,h=21,center=true);
        cylinder(r=DOME_DIA/2-DOME_THICK,h=21.01,center=true);
        translate([0, 0, 10/2+11/2])
            cylinder(r=DOME_DIA/2+5,h=10,center=true);
        translate([0, 0, -10/2-11/2])
            cylinder(r=DOME_DIA/2+5,h=10,center=true);
        
        for(i=[0:31])
        rotate([0,0,i*360/32])
        translate([0, DOME_DIA/2-DOME_THICK-0.2, 0.01])
        //aisle(enter_r=((d%2)==0&&i==2)?5/2:3/2, exit_r=((d%2)==0&&i==2)?6/2:4/2, enter_h=8, exit_h=9, joint=2);
        aisle(enter_r=3.3/2, exit_r=6/2, enter_h=3.2, exit_h=6, joint=0);
    }
//    difference(){
//        translate([0, 0, -21/2])
//        union(){
//            translate([0, 0, 16-0.01])
//                oring_holder(height=5.02, hole=6.2);
//                        
//            translate([0, 0, 13.01])
//                base_plate_middle(height=3.02, hole=6.2);
//
//            translate([0, 0, 8+0.01])
//                base_plate_middle(height=5.02,raspi_base=true, raspi_hole=6.2, hole=6.2);
//
//            translate([0, 0, 8-1.4+0.01])
//                base_plate_middle(height=1.42,raspi_base=true, raspi_hole=2.7, hole=6.2);
//            
//            translate([0, 0, 5+0.01])
//                base_plate_middle(height=1.62, hole=6.2);
//
//            translate([0, 0, 0.01])
//                oring_holder(height=5.02, hole=6.2);
//        }
//        
//        for(d=[0:3])
//        rotate([0,0,d*90])
//        for(m=[0:1])
//        mirror([m,0,0])
//        for(i=[1:3])
//        rotate([0,0,i*30/4])
//        translate([0, DOME_DIA/2-DOME_THICK-1, 0.01])
//        //aisle(enter_r=((d%2)==0&&i==2)?5/2:3/2, exit_r=((d%2)==0&&i==2)?6/2:4/2, enter_h=8, exit_h=9, joint=2);
//        aisle(enter_r=3/2, exit_r=4.5/2, enter_h=8, exit_h=9, joint=3);
//    }
}
module aisle(enter_r=2/2, exit_r=3/2, enter_h=9, exit_h=9, joint=2){
    translate([0,enter_h/2,0])
    rotate([90])
    cylinder(r=enter_r,h=enter_h,center=true);
    translate([0,enter_h+joint/2-0.01,0])
    rotate([90,30])
    cylinder(r1=exit_r, r2=enter_r,h=joint,center=true,$fn=6);
    translate([0,enter_h+joint+exit_h/2-0.2,0])
    rotate([90,30])
    cylinder(r=exit_r,h=exit_h,center=true,$fn=6);
    translate([0,enter_h+joint+exit_h+5/2-0.3,0])
    cube([exit_r*sqrt(3),5,enter_r*2],center=true);
}
       
$fn=360; 
//intersection(){
////    rotate([0,0,20])
    main_chamber();
//    translate([0,0,200/2])
////    translate([0,200/2,0])
//    cube([200,200,200], center=true);
//}