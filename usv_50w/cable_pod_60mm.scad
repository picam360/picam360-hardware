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
    base_h = 3;
    thread_u_h = 10;
    pod_space_h = 25-thread_u_h-base_h;
    thread_b_h = 0;
    bolt_dia = 10;
    
    translate([0,0,pod_space_h+base_h])
    difference(){
        iso_thread(m=inner_dia+4, p=3, l=thread_u_h);
        translate([0,0,-0.01])
        cylinder(r=inner_dia/2-2, h=thread_u_h+0.02);
    }
    translate([0,0,base_h+pod_space_h-5])
    difference(){
        cylinder(r=outer_dia/2, h=5);
        translate([0,0,-0.01])
        cylinder(r2=inner_dia/2-2, r1=outer_dia/2-2, h=5+0.02);
    }
    translate([0,0,base_h])
    difference(){
        cylinder(r=outer_dia/2, h=pod_space_h-5);
        translate([0,0,-0.01])
        cylinder(r=outer_dia/2-2, h=pod_space_h-5+0.02);
    }
    difference(){
        cylinder(r=outer_dia/2, h=base_h);
        translate([0,0,-0.01])
        cylinder(r=bolt_dia/2+4, h=3+0.02);
    }
    difference(){
        cylinder(r=bolt_dia/2+4, h=thread_b_h);
        translate([0,0,-0.01])
            iso_thread(m=bolt_dia, t=0.3, l=thread_b_h+0.02);
        translate([0,0,-0.01])
        cylinder(r1=bolt_dia/2+0.3, r2=10/2-2, h=2);
    }
}

$fn=360;
camera_pod_cover();
 