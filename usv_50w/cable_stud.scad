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
    pod_space_h = 2;
    thread_h = 10;
    connector_r = 45;
    thick = 2;
    difference(){
        union(){
            echo(connector_r=connector_r);
            iso_thread(m=connector_r+8, p=3, l=thread_h*2+pod_space_h);
            translate([0,0,thread_h+pod_space_h/2])
            cylinder(r=(connector_r+8)/2, h=pod_space_h, center=true);
        }
        cylinder(r=connector_r/2, h=100, center=true);
    }
}


$fn=120;
cable_stud();
//camera_pod_100mm();