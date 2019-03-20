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

module pod_cover_100mm(dome_dia=50.8, outer_dia=104, inner_dia=100, tube_thick=2)
{
    cable_r=6.5;
    overlap_h=3+3+6;
    thread_h=10;
    space_h=cable_r+thread_h+2-1;
    difference(){
        union(){
            translate([0,0,space_h-thread_h+overlap_h])
            difference(){
                iso_thread(m=inner_dia+4, p=3, l=thread_h);
                translate([0,0,-0.01])
                cylinder(r=inner_dia/2-tube_thick, h=thread_h+0.02);
            }
            translate([0,0,overlap_h])
            difference(){
                cylinder(r=outer_dia/2, h=space_h-thread_h);
                cylinder(r=inner_dia/2-tube_thick, h=100, center=true);
            }
            cylinder(r=outer_dia/2, h=overlap_h);
            for(i=[0:3]){
                r=97/2;
                translate([r*cos((i+0.5)*360/4), r*sin((i+0.5)*360/4), 12])
                    scale([1,1,2])
                    sphere(r=7/2);
            }
        }
        translate([0,0,-0.01])
        cylinder(r=inner_dia/2+SEAL_MARGIN, h=overlap_h+.02);
        //corver
        bolt_r = 1.7/2;
        for(i=[0:3]){
            r=95/2;
            translate([r*cos((i+0.5)*360/4), r*sin((i+0.5)*360/4), overlap_h])
                cylinder(r=bolt_r, h=3);
        }
        //motor cables
        translate([0,0,overlap_h+cable_r/2+2])
        for(i=[0:3])
            rotate([0, 0, i*90])
                rotate([90, 0, 0])
                    linear_extrude(height=100)
                    hull(){
                        circle(r=cable_r/2);
                        translate([0,100])
                        circle(r=cable_r/2);
                    }
    }
}


$fn=120;
pod_cover_100mm();
//camera_pod_100mm();