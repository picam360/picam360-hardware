include<params.scad>
use<camera_pod_100mm.scad>
use <../lib/ISOThread.scad>

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module cable_stud()
{
    thread_dia=72;
    pod_space_h = 2;
    thread_h = 10;
    thick = 2;
    difference(){
        union(){
            iso_thread(m=thread_dia, p=3, l=thread_h*2+pod_space_h);
            translate([0,0,thread_h+pod_space_h/2])
            cylinder(r=thread_dia/2, h=pod_space_h, center=true);
        }
        cylinder(r=thread_dia/2-2-thick, h=100, center=true);
    }
}


$fn=120;
cable_stud();
//camera_pod_100mm();