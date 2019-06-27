include<params.scad>
use <../lib/ISOThread.scad>

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module usb_thicker()
{
    oiginal_t=1.0;
    target_t=2.5;
    size=[11,8.5,target_t-oiginal_t];
    cube(size);
}


$fn=120;

usb_thicker();