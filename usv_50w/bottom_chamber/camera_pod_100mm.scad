include<../params.scad>
use<camera_pod_60mm.scad>

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}
module  minkowski_square_3d(dimension, r=2)
{
    minkowski()
    {
        cube([dimension.x-r*2,dimension.y-r*2, 0.01], center=true);
        sphere(r=r);
    }
}

module camera_pod_100mm(outer_dia=100, inner_dia=44, tube_thick=2, b_cable=false)
{
    h=10;//need to be ajust for lens height
    difference(){
        union(){
//            translate([0, 0, 3])
//            dome_base(outer_dia=60, h=h);
            difference(){
                cylinder(r=outer_dia/2-0.4, h=3);
                cylinder(r=inner_dia/2, h=100, center=true);
            }
            translate([0, 0, 0.01])
            mirror([0,0,1])
            difference(){
                cylinder(r1=outer_dia/2-tube_thick+0.05,r2=outer_dia/2-tube_thick-0.4, h=5);
                cylinder(r=outer_dia/2-tube_thick-5, h=100, center=true);
            }
        }
        translate([0, 0, 3+0.01])
        mirror([0,0,1])
        linear_extrude(h=100)
        minkowski_square(dimension=[38+0.5,38+0.5], r=1, $fn=100);
        //camera : outline 38x38, hole 34x34
        bolt_r = 2/2;
        for(i=[0:11]){
            r=34*sqrt(2)/2;
            translate([r*cos((i+0.5)*360/12), r*sin((i+0.5)*360/12), 1])
                mirror([0,0,1]){
                    cylinder(r=bolt_r, h=100, center=true);
                    cylinder(r=bolt_r+1.5/2, h=100);
                }
        }
    }
}
$fn=120;
camera_pod_100mm();
 