include<../params.scad>

module oring(hole=BASE_PLATE_BOLT)
{
    rotate_extrude()
    {
        translate([DOME_DIA/2+ORING_DIA/2, 0, 0])
        circle(r=ORING_DIA/2);
    }
}
$fn=360;
oring();

