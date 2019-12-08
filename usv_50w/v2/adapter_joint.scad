include<../params.scad>
use<camera_pod_100mm.scad>
use <../../lib/ISOThread.scad>

module adapter_joint()
{
    thread_dia=74;
    pod_space_h = 2;
    thread_h = 10;
    thick = 2;
    difference(){
        union(){
            iso_thread(m=thread_dia, p=3, l=thread_h*2+pod_space_h);
            translate([0,0,thread_h+pod_space_h/2])
            cylinder(r=thread_dia/2, h=pod_space_h, center=true);
        }
        translate([0,0,100/2+0.4])
        cylinder(r=thread_dia/2-2-thick, h=100, center=true);
        cylinder(r=thread_dia/2-2-thick-10, h=100, center=true);
    }
}


$fn=120;
adapter_joint();
//camera_pod_100mm();