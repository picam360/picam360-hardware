use <../lib/ISOThread.scad>;

module cover(tube_dia=60, thread_h=10, margin=0.25)
{
    dome_dia=46;
    tube_thick=2;
    outer_dia=tube_dia+10;
    thread_dia=tube_dia+6;
    t=0.5;
    upper_thick = 1.5;
    difference(){
        union(){
            translate([0, 0, thread_h])
            intersection()
            {
                cylinder(r=outer_dia/2,h=upper_thick);
                translate([0, 0, -4])
                scale([1,1,0.25])
                if(tube_dia==60)
                    sphere(r=outer_dia/1.77);
                else if(tube_dia==100)
                    sphere(r=outer_dia/1.9);
            }
            cylinder(r=outer_dia/2,h=thread_h);
        }
        cylinder(r=tube_dia/2-8,h=100,center=true);
        cylinder(r=dome_dia/2,h=100,center=true);
        translate([0,0,-0.01])
        iso_thread(m=thread_dia, l=thread_h+0.02, p=3, t=t);
        translate([0,0,-0.01])
        cylinder(r1=thread_dia/2+t, r2=thread_dia/2-2+t, h=4);
        for(i=[0:31])
        rotate(i*360/32)
        translate([outer_dia/2+5.2, 0, 0])
        cylinder(r=5.5,h=100,center=true);
        //6cube([100,100,100]);
    }
    difference(){
        translate([0, 0, thread_h])
        mirror([0,0,1])
        cylinder(r=tube_dia/2-tube_thick-0.5,h=1);
        cylinder(r=dome_dia/2,h=100,center=true);
        cylinder(r=tube_dia/2-8,h=100,center=true);
    }
}

$fn=120;
tube_dia=80;
thread_h=10;
cover(tube_dia=tube_dia, thread_h=thread_h);