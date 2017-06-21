include<../params.scad>

module sealing_plate()
{
    linear_extrude(height = 0.5, twist = 0, slices = 0)
    {
        sealing_plate_2D();
    }
}
module sealing_plate_2D()
{
    difference()
    {
        circle(r = r_from_dia(DOME_DIA)+ORING_DIA-0.1);
        circle(r = r_from_dia(DOME_DIA)-DOME_THICK-0.5);
    }
}

$fn=360;
translate([r_from_dia(DOME_DIA)+ORING_DIA-0.1,-(r_from_dia(DOME_DIA)+ORING_DIA-0.1)])
sealing_plate_2D();
