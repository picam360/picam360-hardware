use<camera_hole.scad>

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        translate([r, r])
        square([dimension.x-r*2,dimension.y-r*2]);
        circle(r=r);
    }
}

module client_fpv_box()
{
    difference()
    {
        minkowski_square([121.5,89.5]);
    }
}

$fn=360;
client_fpv_box();