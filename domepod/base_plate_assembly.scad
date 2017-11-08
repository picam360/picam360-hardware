include<../params.scad>
use<../tools.scad>
use<../dome.scad>
use<base_plate_upper.scad>
use<base_plate_middle.scad>
use<base_plate_bottom_sphere.scad>
use<oring_holder.scad>

module base_plate_assembly()
{

    translate([0, 0, 3-0.01])
        oring_holder(height=5.02);
                
    translate([0, 0, 0.01])
        base_plate_upper(height=3.02);

    translate([0, 0, -5+0.01])
        base_plate_middle(height=5.02);

    translate([0, 0, -8+0.01])
        base_plate_bottom(height=3.02);

    translate([0, 0, -13+0.01])
        oring_holder(height=5.02);
}
       
$fn=360; 
base_plate_assembly();