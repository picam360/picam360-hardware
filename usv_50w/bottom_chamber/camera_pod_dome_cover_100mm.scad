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
module camera_pod_dome_cover_100mm(dome_base_outer_dia=70, outer_dia=104, inner_dia=100, tube_thick=2)
{
    thick=3;
    difference(){
        dome_base_cover(outer_dia=dome_base_outer_dia);
        translate([0, 0, -0.01])
        cylinder(r=dome_base_outer_dia/2+0.01, h=thick+SEAL_MARGIN+0.01);
        //dome corver
        bolt_r = 1.7/2;
        for(i=[0:5]){
            r=46*sqrt(2)/2;
            translate([r*cos((i+0.5)*360/6), r*sin((i+0.5)*360/6), thick+SEAL_MARGIN])
                mirror([0,0,1]){
                    cylinder(r=bolt_r, h=3, center=true);
                }
        }
    }
}

$fn=120;
camera_pod_dome_cover_100mm();
//dome_base();