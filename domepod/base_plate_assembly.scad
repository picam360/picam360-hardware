include<../params.scad>
use<../tools.scad>
use<base_plate_upper.scad>
use<base_plate_middle.scad>
use<base_plate_bottom.scad>
use<oring_holder.scad>

module base_plate_assembly()
{
    difference(){
        translate([0, 0, -21/2])
        union(){
            translate([0, 0, 16-0.01])
                oring_holder(height=5.02, hole=6.2);
                        
            translate([0, 0, 13.01])
                base_plate_middle(height=3.02, hole=6.2);

            translate([0, 0, 8+0.01])
                base_plate_middle(height=5.02,raspi_base=true, raspi_hole=6.2, hole=6.2);

            translate([0, 0, 8-1.4+0.01])
                base_plate_middle(height=1.42,raspi_base=true, raspi_hole=2.7, hole=6.2);
            
            translate([0, 0, 5+0.01])
                base_plate_middle(height=1.62, hole=6.2);

            translate([0, 0, 0.01])
                oring_holder(height=5.02, hole=6.2);
        }
        
        for(d=[0:3])
        rotate([0,0,d*90])
        for(m=[0:1])
        mirror([m,0,0])
        for(i=[1:4])
        rotate([0,0,i*(30-3)/5+3/2])
        translate([0, DOME_DIA/2-DOME_THICK-1, 0.01])
        //aisle(enter_r=((d%2)==0&&i==2)?5/2:3/2, exit_r=((d%2)==0&&i==2)?6/2:4/2, enter_h=8, exit_h=9, joint=2);
        aisle(enter_r=3/2, exit_r=4.5/2, enter_h=8, exit_h=9, joint=2);
    }
}
module aisle(enter_r=2/2, exit_r=3/2, enter_h=9, exit_h=9, joint=2){
    translate([0,enter_h/2,0])
    rotate([90])
    cylinder(r=enter_r,h=enter_h,center=true);
    translate([0,enter_h+joint/2,0])
    rotate([90])
    cylinder(r1=exit_r, r2=enter_r,h=joint,center=true);
    translate([0,enter_h+joint+exit_h/2,0])
    rotate([90])
    cylinder(r=exit_r,h=exit_h,center=true);
}
       
$fn=360; 
base_plate_assembly();