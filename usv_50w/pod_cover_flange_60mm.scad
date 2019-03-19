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

module pod_cover_100mm(dome_dia=50.8, outer_dia=64, inner_dia=60, tube_thick=2)
{
    overlap_h=12;
    space_h=5;
    difference(){
        union(){
            translate([0,0,overlap_h])
            difference(){
                cylinder(r=outer_dia/2, h=space_h);
                cylinder(r=inner_dia/2-tube_thick, h=100, center=true);
            }
            cylinder(r=outer_dia/2, h=overlap_h);
            for(i=[0:3]){
                r=57/2;
                translate([r*cos((i+0.5)*360/4), r*sin((i+0.5)*360/4), 12])
                    scale([1,1,2])
                    sphere(r=7/2);
            }
        }
        translate([0,0,-0.01])
        cylinder(r=inner_dia/2+SEAL_MARGIN, h=overlap_h+.02);
        translate([0,0,overlap_h+space_h])
        cylinder(r=outer_dia, h=100);
        //corver
        bolt_r = 1.7/2;
        for(i=[0:3]){
            r=55/2;
            translate([r*cos((i+0.5)*360/4), r*sin((i+0.5)*360/4), overlap_h])
                cylinder(r=bolt_r, h=3);
        }
    }
}


$fn=120;
pod_cover_100mm();
//camera_pod_100mm();