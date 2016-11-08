include<../params.scad>
use<arm.scad>

module arm_upper()
{
    linear_extrude(height = 3, twist = 0, slices = 0)
    {
        arm_upper_2D();
    }
}
module arm_upper_2D()
{
	difference()
	{
	    arm_2D(margin=0);
        circle(r=r_from_dia(PROP_SHROUD_DIA+.01));
    }
}

$fn = 1000;
arm_upper_2D();

