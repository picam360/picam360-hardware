use <../lib/ISOThread.scad>;

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module camera_pod_cover(dome_dia=50.8, outer_dia=116, inner_dia=108, tube_thick=2, margin=0.25)
{
    thread_h = 10;
    
    translate([0,0,thread_h])
    difference(){
        cylinder(r=outer_dia/2, h=3);
        translate([0,0,-0.01])
        iso_thread(m=10, t=0.3, l=3+0.02);
        for(i=[0:1])
            rotate(i*360/2)
            translate([100/3,0,-0.01])
            cylinder(r=10/2, h=3+0.02);
    }
    difference(){
        cylinder(r=outer_dia/2, h=thread_h);
        translate([0,0,-0.01])
            iso_thread(m=inner_dia+margin*2+4, p=3, t=0.4, l=thread_h+0.02);        translate([0,0,-0.01])
        cylinder(r1=(inner_dia+margin*2+4)/2+0.4, r2=(inner_dia+margin*2)/2, h=4);
    }
}

$fn=360;
camera_pod_cover();
 