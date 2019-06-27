include<params.scad>

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module lenshole_seal()
{
    lenshole_dia=15.8;
    cylinder(r1=lenshole_dia/2+5, r2=lenshole_dia/2+5-2, h=2);
    rotate([180,0,0])
    cylinder(r1=lenshole_dia/2, r2=lenshole_dia/2-0.5, h=3);
}

$fn=120;
lenshole_seal();