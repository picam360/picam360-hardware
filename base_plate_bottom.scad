include<params.scad>

module base_plate_bottom()
{
    linear_extrude(height = 2, twist = 0, slices = 0)
    {
        base_plate_bottom_2D();
    }
}
module base_plate_bottom_2D()
{
    roundess=3;
    hole_pos = r_from_dia(DOME_DIA)-DOME_THICK-r_from_dia(8)-0;
    difference()
    {
        union()
        {
            translate([0, 0, 0])
                circle(r = r_from_dia(DOME_DIA+30));
        }
		//arm
		arm_pos = (DOME_DIA+30)/2-5+PROP_SHROUD_DIA/2;
	    for(i=[0:3])
		{
			rotate([0,0,90*i+45])
			{
			    translate([0, arm_pos])
	        		circle(r = r_from_dia(PROP_SHROUD_DIA));
			}
		}
    }
}

$fn=360;
base_plate_bottom_2D();
