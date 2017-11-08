include<../params.scad>
use<arm.scad>
use<arm_upper.scad>

$fn=360;
difference(){
    arm(height=31, margin=0, minkowski_fn=360);
    translate([0,0,5])
    cylinder(r=22.48,h=100);
    translate([0,-82.47,5])
    cylinder(r=65,h=21);
}