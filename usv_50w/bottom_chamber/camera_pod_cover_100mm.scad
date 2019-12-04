include<../params.scad>
use<../camera_pod_100mm.scad>
use<../dome_base_cover.scad>
use<../dome_base.scad>
module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module camera_pod_base_cover_100mm(dome_base_dia=64, outer_dia=104, inner_dia=100, tube_thick=2)
{
    overlap_h=3+6;
    h=3;
    translate([0, 0, SEAL_MARGIN])
    difference(){
        cylinder(r=outer_dia/2, h=h);
        translate([0, 0, -0.01])
        cylinder(r1=dome_base_dia/2-2.2+SEAL_MARGIN, r2=dome_base_dia/2-3.3+SEAL_MARGIN, h=h+.02);
        //dome corver
        bolt_r = 2/2;
        for(i=[0:5]){
            r=46*sqrt(2)/2;
            translate([r*cos((i+0.5)*360/6), r*sin((i+0.5)*360/6), 2])
                mirror([0,0,1]){
                    cylinder(r=bolt_r, h=100, center=true);
                    cylinder(r=bolt_r+1.5/2, h=100);
                }
        }
    }
    translate([0, 0, -overlap_h+0.01])
    difference(){
        cylinder(r=outer_dia/2, h=overlap_h+SEAL_MARGIN);
        translate([0, 0, -0.01])
        cylinder(r=inner_dia/2+SEAL_MARGIN, h=overlap_h+0.02+SEAL_MARGIN);
    }
}

$fn=120;
camera_pod_base_cover_100mm();
//dome_base();