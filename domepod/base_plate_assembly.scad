include<../params.scad>
use<../tools.scad>
use<base_plate_upper.scad>
use<base_plate_middle.scad>
use<base_plate_bottom.scad>
use<oring_holder.scad>

module base_plate_assembly()
{
    difference(){
        union(){
            translate([0, 0, 3-0.01])
                oring_holder(height=5.02);
                        
            translate([0, 0, 0.01])
                base_plate_upper(height=3.02);

            translate([0, 0, -5+0.01])
                base_plate_middle(height=5.02,raspi_base=true);

            translate([0, 0, -5-1.4+0.01])
                base_plate_bottom(height=1.42,raspi_base=true);
            
            translate([0, 0, -8+0.01])
                base_plate_upper(height=1.62);

            translate([0, 0, -13+0.01])
                oring_holder(height=5.02);
        }
    
        translate([0, 0, -8+1.6])
        for(i=[0,1])
            mirror([0,i]) for(j=[0,1])
                mirror([j,0]) translate([-58/2, -49/2, 100/2+1.4])
                    cylinder(r = r_from_dia(6), h=100, center=true);
        for(i=[0,1])
            mirror([0,i]) for(j=[0,1])
                mirror([j,0]) translate([-58/2, -49/2, 0])
                    cylinder(r = r_from_dia(2.7), h=100, center=true);
    }
}
       
$fn=360; 
base_plate_assembly();