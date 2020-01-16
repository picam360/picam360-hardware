include<../params.scad>
use <../lib/ISOThread.scad>

module cover_adapter(tube_dia=60, thread_h=10)
{
    tube_thick = 2;
    thread_dia=tube_dia+6;
    difference(){
        iso_thread(m=thread_dia, p=3, l=thread_h);
        translate([0,0,1.0])
        cylinder(r1=tube_dia/2+0.4, r2=tube_dia/2+0.8, h=thread_h);
        translate([0,0,-0.01])
        cylinder(r=tube_dia/2-tube_thick, h=100);
    }
}


$fn=120;
tube_dia=80;
thread_h=10;
cover_adapter(tube_dia=tube_dia, thread_h=thread_h);