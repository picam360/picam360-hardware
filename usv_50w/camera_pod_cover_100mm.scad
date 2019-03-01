include<params.scad>
use<camera_pod_100mm.scad>
use<dome_base_cover.scad>
use<dome_base.scad>
module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module camera_pod_cover_100mm_1(dome_base_dia=64, outer_dia=104, inner_dia=100, tube_thick=2)
{
    translate([0, 0, SEAL_MARGIN])
    difference(){
        cylinder(r=outer_dia/2, h=2);
        translate([0, 0, -0.01])
        cylinder(r1=dome_base_dia/2-2.2+SEAL_MARGIN, r2=dome_base_dia/2-3.3+SEAL_MARGIN, h=2.02);
    }
    overlap_h=10+3;
    translate([0, 0, -overlap_h+0.01])
    difference(){
        cylinder(r=outer_dia/2, h=overlap_h+SEAL_MARGIN);
        translate([0, 0, -0.01])
        cylinder(r=inner_dia/2+SEAL_MARGIN, h=overlap_h+0.02+SEAL_MARGIN);
    }
}

module camera_pod_cover_100mm_2(dome_base_dia=64, outer_dia=104, inner_dia=100, tube_thick=2)
{
    thick=2;
    difference(){
        dome_base_cover();
        translate([0, 0, -0.01])
        cylinder(r=dome_base_dia/2+0.01, h=thick+SEAL_MARGIN+0.01);
    }
}

$fn=120;
camera_pod_cover_100mm_1();
//camera_pod_cover_100mm_2();
//dome_base();