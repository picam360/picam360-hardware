include<../params.scad>

module oring_holder(hole=BASE_PLATE_BOLT)
{
    linear_extrude(height = 5, twist = 0, slices = 0)
    {
        oring_holder_2D(hole=hole);
    }
}
module oring_holder_2D(hole=BASE_PLATE_BOLT)
{
    difference()
    {
        translate([0, 0, 0])
	        circle(r = r_from_dia(DOME_DIA+30));
        translate([0, 0, 0])
	        circle(r = r_from_dia(DOME_DIA)+ORING_DIA-0.2);
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
        if(hole > 0)
        {
            //bolt hole for arm
            for(i=[0:11])
            {
                translate([(DOME_DIA+20)/2*cos(i*30), (DOME_DIA+20)/2*sin(i*30), 0])
                rotate([0,0,i*30+30])
                    circle(r = r_from_dia(hole), center=true, $fn=hole>4?6:100);
            }            
        }
    }
}

$fn=360;
translate([(DOME_DIA+30)/2, -(DOME_DIA+30)/2, 0])
    oring_holder_2D();

