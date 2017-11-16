include<../params.scad>

module oring_holder_inner()
{
    linear_extrude(height = 0.5, twist = 0, slices = 0)
    {
        oring_holder_inner_2D();
    }
}
module oring_holder_inner_2D()
{
    difference(){
        circle(r = r_from_dia(DOME_DIA));
        circle(r = r_from_dia(DOME_DIA) - 10);
    }
}

$fn=360;
translate([r_from_dia(DOME_DIA),-r_from_dia(DOME_DIA)])
oring_holder_inner_2D();
