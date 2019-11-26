use <../../lib/ISOThread.scad>
use<../bottom_chamber/cable_stud.scad>

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module cable_pod_60mm(dome_dia=50.8, outer_dia=76, inner_dia=68, tube_thick=2, margin=0.25)
{
    base_h = 3;
    thread_u_h = 10;
    pod_space_h = 70-thread_u_h-base_h;
    thread_b_h = 10;
    connector_r = 45;
    cable_r = 5.5;
    bottom_r = 108;
    
    translate([0,0,pod_space_h+base_h])
    difference(){
        iso_thread(m=inner_dia+4, p=3, l=thread_u_h);
        translate([0,0,-0.01])
        cylinder(r=inner_dia/2-2, h=thread_u_h+0.02);
        //cable
        cube([cable_r,100,100],center=true);
    }
    translate([0,0,base_h+pod_space_h-5])
    difference(){
        cylinder(r=outer_dia/2, h=5);
        translate([0,0,-0.01])
        cylinder(r2=inner_dia/2-2, r1=outer_dia/2-2, h=5+0.02);
        //cable
        translate([0,0,cable_r/2])
        for(i=[0,2])
            rotate([0, 0, i*90])
                rotate([90, 0, 0])
                    linear_extrude(height=100)
                    hull(){
                        circle(r=cable_r/2);
                        translate([0,100])
                        circle(r=cable_r/2);
                    }
    }
    translate([0,0,base_h+pod_space_h-20-5])
    difference(){
        cylinder(r2=outer_dia/2, r1=bottom_r/2, h=20);
        translate([0,0,-0.01])
        cylinder(r2=outer_dia/2-2, r1=bottom_r/2-2, h=20+0.02);
    }
    translate([0,0,base_h])
    difference(){
        cylinder(r=bottom_r/2, h=pod_space_h-5-20);
        translate([0,0,-0.01])
        cylinder(r=bottom_r/2-2, h=pod_space_h-5+0.02);
    }
    difference(){
        cylinder(r=bottom_r/2, h=base_h);
        translate([0,0,-0.01])
        cylinder(r=(inner_dia+4)/2, h=3+0.02);
    }
    difference(){
        cylinder(r=outer_dia/2, h=thread_b_h);
        translate([0,0,-0.01])
        iso_thread(m=inner_dia+4, p=3, t=0.3, l=thread_b_h+0.02);
        translate([0,0,-0.01])
        cylinder(r1=(inner_dia+4)/2, r2=(inner_dia+4)/2-2, h=4);
    }
}

$fn=120;
cable_pod_60mm();
 
//translate([0,0,-10])
//cable_stud();