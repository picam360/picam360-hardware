use <../lib/ISOThread.scad>
use<camera_pod_100mm.scad>
use<pod_seal_60mm.scad>

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module camera_pod_cover(dome_dia=50.8, outer_dia=100, inner_dia=100, tube_thick=2, seal_margin=0.4)
{
    thread_u_h=10;
    inner_dia=64;
    translate([0,0,7.4])
    difference(){
        iso_thread(m=inner_dia+4, p=3, l=thread_u_h);
        translate([0,0,-0.01])
        cylinder(r=inner_dia/2-0.01, h=thread_u_h+0.02);
    }
    difference(){
        cylinder(r=outer_dia/2, h=2);
        cylinder(r=60/2+seal_margin, h=100, center=true);
            for(i=[0:3])
                rotate([0, 0, i*90])
                for(j=[-1,0,1])
                rotate([0, 0, j*10])
                {
                    translate([32+3/2+0.01, 0, -0.01])
                    cylinder(r=3/2, h=100);
                }
    }
    difference(){
        translate([0, 0, -5+seal_margin])
        import("pod_cover_60mm.stl");
        translate([0,0,-100/2])
        cylinder(r=100, h=100, center=true);
    }
}

$fn=360;
translate([0, 0, 10+0.4])
camera_pod_cover();
//translate([0, 0, 19+0.4])
//pod_seal();
//camera_pod_100mm();