
use <../lib/ISOThread.scad>
use<camera_pod_100mm.scad>
use<pod_seal_60mm.scad>

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module pod_cover_100(outer_dia=100, cable_r=3, bent_r=4)
{
    hole_dia = 18;
    h=3;
    pin=15;
    step=7;
    ary=4;
    difference(){
        union(){
            cylinder(r=outer_dia/2, h=h);
            for(i=[0:ary-1])
            {
                for(j=[0:ary-1])
                {
                    translate([(j-(ary/2-0.5))*step, (i-(ary/2-0.5))*step, 0])
                    cylinder(r1=9/2, r2=(cable_r+3)/2, h=5);
                }
            }
            for(i=[0:3])
            {
                for(j=[-1:1])
                {
                    rotate(j*10+90*i)
                    translate([39, 0, 0])
                    cylinder(r1=9/2, r2=(cable_r+3)/2, h=5);
                }
            }
            rotate(45)
            translate([39, 0, 0])
            cylinder(r1=9/2, r2=(bent_r+3)/2, h=5);
        }
        for(i=[0:ary-1])
        {
            for(j=[0:ary-1])
            {
                translate([(j-(ary/2-0.5))*step, (i-(ary/2-0.5))*step, -0.01])
                cylinder(r1=6/2, r2=cable_r/2, h=5.02);
            }
        }
        for(i=[0:3])
        {
            for(j=[-1:1])
            {
                rotate(j*10+90*i)
                translate([39, 0, -0.01])
                cylinder(r1=6/2, r2=cable_r/2, h=5.02);
            }
        }
        rotate(45)
        translate([39, 0, -0.01])
        cylinder(r1=6/2, r2=bent_r/2, h=5.02);
    }
}

$fn=120;
pod_cover_100();