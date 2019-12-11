include<params.scad>
use<oring.scad>

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module camera_seal(tube_dia=60, tube_thick=2, h=5)
{
    bolt_r = 1.7/2;
    board_h=1.6;
    dome_inner=42;
    cable_r=4.5;
    oring_dia = 7/2;
    difference()
    {
        union(){
            cylinder(r=tube_dia/2-tube_thick-0.1, h=h);
            ext_h = oring_dia/2+2;
            translate([0,0,-ext_h])
            cylinder(r=dome_inner/2, h=ext_h+0.01);
        }
        translate([0,0,0])
        oring(outer_dia=56.7+0.3, inner_dia=49.7+0.3);
        
        //for depressure
        for(i=[0:4]){
            r=23;
            translate([r*cos((i+0.0)*360/4), r*sin((i+0.0)*360/4), 2])
                cylinder(r=1.25, h=100,center=true);
        }
        cylinder(r=dome_inner/2-2, h=100, center=true);
        
        translate([0,0,h+0.01])
        mirror([0,0,1])
        linear_extrude(height=board_h+1.6+0.02)
        minkowski_square(dimension=[38+0.5,38+0.5], r=1, $fn=100);
    }
    for(i=[0:3]){
        r=34*sqrt(2)/2;
        translate([r*cos((i+0.5)*360/4), r*sin((i+0.5)*360/4), h-1.6])
        mirror([0,0,1])
        difference(){
            linear_extrude(height=board_h+0.02)
            minkowski_square(dimension=[5,5], r=0.5, $fn=100);
            cylinder(r=bolt_r, h=100,center=true);
        }
    }
}

$fn=120;
camera_seal();
 