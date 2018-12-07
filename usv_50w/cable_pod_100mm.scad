use <../lib/ISOThread.scad>;

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}
module cable_pod_100mm(dome_dia=50.8, inner_dia=108, tube_thick=2, margin=0.25)
{
    pod_space_h = 100-3;
    flange_h = 3;
    joint_h = 10;
    thread_h = 10;
    taper_h = 3.3;
    taper2_h = 20;
    
    translate([0,0,pod_space_h-flange_h])
    difference(){
        cylinder(r=inner_dia/2, h=flange_h);
        cylinder(r=10/2+0.5, h=100, center=true);
    }
    translate([0,0,pod_space_h-joint_h])
    difference(){
        cylinder(r=25/2, h=joint_h);
        cylinder(r=20/2+0.5, $fn=6, h=100, center=true);
    }
    
    tube_dia = 60;
    translate([0,0,thread_h+taper2_h+flange_h])
    difference(){
        union(){
            cylinder(r=tube_dia/2, h=pod_space_h-(thread_h+taper2_h+2*flange_h), $fn=6);
            cylinder(r1=tube_dia/2,r2=(tube_dia/2)*sqrt(3)/2, h=taper_h);
        }
        cylinder(r=tube_dia/2-tube_thick, h=200, $fn=6, center=true);
        translate([0,0,pod_space_h-(thread_h+taper2_h+2*flange_h)-10/2-6])
        rotate([90,0,0])
        cylinder(r=10/2, h=200, center=true);
        translate([0,0,10/2+6])
        rotate([90,0,0])
        cylinder(r=10/2, h=200, center=true);
    }
    translate([0,0,thread_h+flange_h])
    difference(){
        cylinder(r1=inner_dia/2,r2=tube_dia/2, h=taper2_h);
        translate([0,0,-0.01])
        cylinder(r1=inner_dia/2-2,r2=tube_dia/2-2, h=taper2_h+0.02);
    }
    tube_dia = 60;
    translate([0,0,thread_h])
    difference(){
        cylinder(r=inner_dia/2, h=flange_h);
        cylinder(r=inner_dia/2-tube_thick, h=200, center=true);
    }
    difference(){
        iso_thread(m=inner_dia+4, p=3, l=thread_h);
        translate([0,0,-0.01])
        cylinder(r=inner_dia/2-tube_thick, h=thread_h+0.02);
    }
}

$fn=360;
cable_pod_100mm();
 