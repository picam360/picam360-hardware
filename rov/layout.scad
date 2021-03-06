include<../params.scad>
use<../domepod/acrylic_dome.scad>

use<../domepod/base_plate_assembly.scad>

use<arm_assemble.scad>

$fn=100;

metal_color=[0.8,0.8,0.8];
pcb_color=[0,0.8,0];

translate([0,0,6])
base_plate_assembly();

//arm
//for(m=[0,1])
//for(i=[45,135])
//for(m1=[0,1])
angle=0;
union(){
    translate([0,0,-8])
    rotate([0,0,45])
        arm_assemble(rotate=[-0,angle==0?0:-90+angle,0]);

    translate([0,0,-8])
        mirror([1,0,0])
        rotate([0,0,45])
        arm_assemble(rotate=[0,angle,0]);
        
    translate([0,0,-8])
        mirror([0,1,0])
        rotate([0,0,45])
        arm_assemble(rotate=[0,-angle,0]);

    translate([0,0,-8])
        mirror([1,0,0])
        mirror([0,1,0])
        rotate([0,0,45])
        arm_assemble(rotate=[0,angle==0?0:90-angle,0]);
}

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
