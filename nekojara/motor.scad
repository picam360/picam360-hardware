
$fn=100;
module motor(){
    motor_height=15;
    cylinder(r=6/2,h=10);
    translate([0,0,-3])
    cylinder(r=4/2,h=3);
    translate([0,0,-3-motor_height])
    cylinder(r=35/2,h=motor_height);
}

motor();