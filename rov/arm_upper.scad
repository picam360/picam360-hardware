include<../params.scad>
use<arm.scad>

module arm_upper(height = 3, margin = 0)
{
    linear_extrude(height = height, twist = 0, slices = 0)
    {
        arm_upper_2D(margin);
    }
}
module arm_upper_2D(margin=0)
{
	difference()
	{
	    arm_2D(margin=margin);
        circle(r=r_from_dia(PROP_SHROUD_DIA+.01));
    }
}

$fn = 360;
arm_upper(margin=0);

