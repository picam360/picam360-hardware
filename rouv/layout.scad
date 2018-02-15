include<../params.scad>
use<acrylic_dome.scad>

use<main_chamber.scad>
use<oring_holder.scad>
use<chamber_bottom.scad>
use<inner_thread.scad>
use<skrew_mount.scad>

$fn=100;
half=false;
rouv=true;

metal_color=[0.8,0.8,0.8];
pcb_color=[0,0.8,0];

translate([0,0,21/2])
oring_holder();
translate([0,0,0])
main_chamber();
rotate([180,0,0])
translate([0,0,21/2])
oring_holder();

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


if(rouv){
    for(i=[0:3])
    rotate([0,0,90*i+45])
    skrew_mount();
}else{
    for(i=[0:3])
    rotate([0,0,90*i])
    inner_thread();
}

if(half){
    translate([0,0,-11/2])
    rotate([180,0,0])
    chamber_bottom();
}else{
    rotate([180,0,0])
    translate([0,0,11/2])
    color([0.5, 0.5, 0.8, 0.5])
    acrylic_dome();
}
translate([0,0,11/2])
color([0.5, 0.5, 0.8, 0.5])
acrylic_dome();
