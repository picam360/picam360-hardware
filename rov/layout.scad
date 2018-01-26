include<../params.scad>
use<../domepod/acrylic_dome.scad>

use<../domepod/base_plate_upper.scad>
use<../domepod/base_plate_middle.scad>
use<../domepod/base_plate_bottom.scad>

use<../domepod/oring_holder_cover.scad>
use<../domepod/oring_holder.scad>
use<../domepod/oring_holder_inner.scad>
use<../domepod/oring_holder_bottom.scad>

use<arm_assemble.scad>

$fn=100;

metal_color=[0.8,0.8,0.8];
pcb_color=[0,0.8,0];

translate([0,0,11])
oring_holder();
translate([0,0,8])
base_plate_upper();
translate([0,0,3])
base_plate_middle();
translate([0,0,0])
base_plate_bottom();
translate([0,0,-5])
oring_holder();

//for(m=[0,1])
//for(i=[45,135])
//for(m1=[0,1])
shift=64;
    rotate([0,0,0])
    translate([-shift,shift,-8])
        arm_assemble(rotate=[-45,0,0]);

    rotate([0,0,0])
    translate([shift,shift,-8])
        mirror([1,0,0])
        arm_assemble(rotate=[-45,0,0]);
        
    translate([-shift,-shift,-8])
        mirror([0,1,0])
        arm_assemble(rotate=[45,0,0]);

    translate([shift,-shift,-8])
        mirror([1,0,0])
        mirror([0,1,0])
        arm_assemble(rotate=[45,0,0]);

//lens
translate([0,0,40])
{
    scale([1,1,0.5])
    color([0.2, 0.2, 0.2])
    difference()
    {
        sphere(r=32/2);
        translate([0,0,-50/2])
        cube([50,50,50],center=true);
    }
    translate([0,0,-5])
    color([0, 0, 0])
    cylinder(r=35/2,h=5);
    translate([0,0,-15])
    color([0, 0, 0])
    cylinder(r=25/2,h=13);
}
//camera board
translate([0,0,25])
color([0.2, 0.2, 0.2])
minkowski()
{
    $fn=100;
    r_rad=2;
    square([45-r_rad*2,45-r_rad*2], center=true);
    circle(r=r_rad);
}
//interface board
translate([0,0,20])
color([0.4, 0.4, 0.4])
minkowski()
{
    $fn=100;
    r_rad=2;
    square([65-r_rad*2,56-r_rad*2], center=true);
    circle(r=r_rad);
}
//rpi board
translate([0,0,0])
color(pcb_color)
minkowski()
{
    $fn=100;
    r_rad=2;
    square([65-r_rad*2,56-r_rad*2], center=true);
    circle(r=r_rad);
}

//stad
for(i=[-1,1])
for(j=[-1,1])
translate([(65/2-4)*j,(56/2-4)*i,11])
color(metal_color)
cylinder(r=5/2,h=10,$fn=6);

//stad
for(i=[-1,1])
for(j=[-1,1])
translate([(45/2-4)*j,(45/2-4)*i,20])
color(metal_color)
cylinder(r=5/2,h=6);

//bolt
bolt_size=3.5;
translate([0,0,5])
color(metal_color)
for(i=[0:11])
{
    translate([(DOME_DIA+20)/2*cos(i*30), (DOME_DIA+20)/2*sin(i*30), 0])
        cylinder(r = r_from_dia(bolt_size),h=28, center=true);
}

translate([0,0,11])
color([0.5, 0.5, 0.8, 0.5])
acrylic_dome();

translate([0,0,0])
color([0.5, 0.5, 0.8, 0.5])
rotate([180,0,0])
acrylic_dome();
