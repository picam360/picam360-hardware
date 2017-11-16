include<../params.scad>

module bottom_plate()
{
    linear_extrude(height = 5, twist = 0, slices = 0)
    {
        bottom_plate_2D();
    }
}
module bottom_plate_2D()
{
    difference()
    {
        translate([0, 0, 0])
	        circle(r = r_from_dia(DOME_DIA+30));
		bolt_size = 2.8;
	    for(i=[0:11])
	    {
	        translate([(DOME_DIA+20)/2*cos(i*30), (DOME_DIA+20)/2*sin(i*30), 0])
		        circle(r = r_from_dia(bolt_size), center=true);
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
translate([(DOME_DIA+30)/2, -(DOME_DIA+30)/2, 0])
    bottom_plate_2D();

