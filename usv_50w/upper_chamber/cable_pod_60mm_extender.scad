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
    thread_u_h = 10;
    pod_space_h = 50-thread_u_h;
    thread_b_h = 10;
    bolt_dia = 10;
    
    translate([0,0,pod_space_h+thread_b_h])
    difference(){
        iso_thread(m=inner_dia+4, p=3, l=thread_u_h);
        translate([0,0,-0.01])
        cylinder(r=inner_dia/2-2, h=thread_u_h+0.02);
    }
    translate([0,0,thread_b_h+pod_space_h-5])
    difference(){
        cylinder(r=outer_dia/2, h=5);
        translate([0,0,-0.01])
        cylinder(r2=inner_dia/2-2, r1=outer_dia/2-2, h=5+0.02);
    }
    translate([0,0,thread_b_h])
    difference(){
        cylinder(r=outer_dia/2, h=pod_space_h-5);
        translate([0,0,-0.01])
        cylinder(r=outer_dia/2-2, h=pod_space_h-5+0.02);
    }
    difference(){
        cylinder(r=outer_dia/2, h=thread_b_h);
        translate([0,0,-0.01])
            iso_thread(m=inner_dia+4, t=0.3, p=3, l=thread_b_h+0.02);
        translate([0,0,-0.01])
        cylinder(r1=(inner_dia+4)/2+0.3, r2=(inner_dia+4)/2-2, h=2);
    }
}

$fn=360;
camera_pod_cover();
 