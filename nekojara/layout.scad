use <dome_bottom.scad>;
use <dome_upper.scad>;
use <center_gear.scad>;
use <motor_gear.scad>;
use <motor_mount.scad>;
use <motor.scad>;
use <nut.scad>;
use <pcb.scad>;

metal_color=[0.8,0.8,0.8];
pcb_color=[0,0.8,0];
gear1_color=[0.8,0.8,0];
gear2_color=[0,0.8,0.8];
$fn=100;
translate([0,0,19])
difference(){
    dome_upper();
    translate([0,0,-50])
    cube([100,100,100]);
}

translate([0,0,-12])
dome_bottom();

translate([0,0,12])
rotate([180,0,$t*360])
color(gear1_color)
center_gear();

translate([-30,0,7])
rotate([0,0,20-$t*360*4])
color(gear2_color)
motor_gear();

translate([-30,0,1])
color(metal_color)
motor();

translate([-30,0,-2])
rotate([180,0,0])
motor_mount();

translate([0,0,-8-2])
color(metal_color)
difference(){
    rotate([0,0,-180])
    nut();
    translate([0,0,-50])
    cube([100,100,100]);
}


translate([-85/2,-56/2,-2])
color(pcb_color)
linear_extrude(height = 2, twist = 0, slices = 0)
{
    pcb();
}
translate([-85/2,-56/2,-35])
color(pcb_color)
linear_extrude(height = 2, twist = 0, slices = 0)
{
    raspi();
}

for(i=[-1,1])
translate([-(85/2-3),(56/2-3)*i,-40])
color(metal_color)
cylinder(r=5/2,h=40,$fn=6);
for(i=[-1,1])
translate([-(85/2-3)+65-6,(56/2-3)*i,-40])
color(metal_color)
cylinder(r=5/2,h=40,$fn=6);