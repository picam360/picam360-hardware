use <dome_bottom.scad>;
use <dome_upper.scad>;
use <motor_gear.scad>;
use <motor_mount.scad>;
use <motor.scad>;
use <nut.scad>;
use <pcb.scad>;

use <rotor_yaw.scad>;
use <rotor_yaw_gear.scad>;
use <rotor_pitch.scad>;
use <rotor_pitch_gear.scad>;
use <arm.scad>;
use <arm_shaft.scad>;

use <slipring_electrode.scad>;

metal_color=[0.8,0.8,0.8];
pcb_color=[0,0.8,0];
gear1_color=[0.8,0.8,0];
gear2_color=[0,0.8,0.8];
$fn=100;
gear1_angle = $t;
gear2_angle = -$t*2;
translate([0,0,32])
//difference(){
    dome_upper();
//    translate([0,0,-50])
//    cube([100,100,100]);
//}

translate([0,0,0])
dome_bottom();

translate([0,0,20])
rotate([0,0,gear1_angle*360])
color(gear1_color)
union(){
rotate([0,0,90])
rotor_yaw();
translate([0,0,-19])
rotor_yaw_gear();
arm_shaft();
rotate([0,0,180])
arm_shaft();
}

//difference(){
union(){
    rotate([0,0,(gear2_angle+gear1_angle)*360])
    translate([0,0,20])
    color(gear2_color)
    rotor_pitch_gear();

    translate([0,0,20])
    color(gear2_color)
    rotate([gear2_angle*360,0,gear1_angle*360])
    union(){
    rotor_pitch();
    rotate([0,0,180])
    rotor_pitch();
    translate([0,6,0])
    arm();
    }
}
//    cube([100,100,100]);
//}
    
    
//slipring
translate([0,0,33])
color(metal_color)
union(){
slipring_electrode(r=17, attach_margin=0);
slipring_electrode(r=23.5, attach_margin=0);
}
    
//motor
    
translate([-28,0,5])
rotate([0,0,20-$t*360*4])
color(gear2_color)
motor_gear();

translate([-28,0,1])
color(metal_color)
motor();

translate([-28,0,-2])
rotate([180,0,0])
motor_mount();

translate([28,0,1])
rotate([0,0,20-$t*360*4])
color(gear2_color)
motor_gear();

translate([28,0,1])
color(metal_color)
motor();

translate([28,0,-2])
rotate([180,0,0])
motor_mount();
//
translate([0,0,-6-2])
//color(metal_color)
//difference(){
    rotate([0,0,-90])
    nut();
//    translate([0,0,-50])
//    cube([100,100,100]);
//}
//
//
translate([-85/2,-56/2,-2])
color(pcb_color)
linear_extrude(height = 2, twist = 0, slices = 0)
{
    pcb();
}

translate([-85/2-2.5,-56/2-1.5,-38.5])
 import("RaspberryPi3.stl");

//stad
for(i=[-1,1])
translate([-(85/2-3),(56/2-3)*i,-43.5])
color(metal_color)
cylinder(r=5/2,h=43.5,$fn=6);
for(i=[-1,1])
translate([-(85/2-3)+65-6,(56/2-3)*i,-43.5])
color(metal_color)
cylinder(r=5/2,h=43.5,$fn=6);

//lens
translate([0,0,65])
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
