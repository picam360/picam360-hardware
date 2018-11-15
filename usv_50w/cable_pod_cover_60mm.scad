use <../lib/ISOThread.scad>;

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module camera_pod_cover(dome_dia=50.8, outer_dia=72, inner_dia=64, tube_thick=2, margin=0.25)
{
    pod_space_h = 20+2-margin;
    thread_h = 10;
    
    translate([0,0,pod_space_h+thread_h])
    difference(){
        cylinder(r=outer_dia/2, h=3);
        cylinder(r=60/2+margin, h=100, center=true);
    }
    translate([0,0,thread_h])
    difference(){
        cylinder(r=outer_dia/2, h=pod_space_h);
        cylinder(r=inner_dia/2+margin, h=100, center=true);
    }
    difference(){
        cylinder(r=outer_dia/2, h=thread_h);
        translate([0,0,-0.01])
            iso_thread(m=inner_dia+margin*2+4, p=3, t=0.3, l=thread_h+0.02);
        translate([0,0,-0.01])
        cylinder(r1=(inner_dia+margin*2+4)/2+0.3, r2=(inner_dia+margin*2)/2, h=4);
    }
}

$fn=360;
camera_pod_cover();
 