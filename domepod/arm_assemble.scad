include<../params.scad>
use<arm.scad>
use<arm_upper.scad>

$fn=360;
mirror([0,0,1])
arm(height=5,margin=0);
difference(){
    cylinder(r=25, h=21+5);
    translate([0,0,-1])
    cylinder(r=22.5, h=100);
}
translate([0,0,21])
arm_upper(height=5,margin=0);