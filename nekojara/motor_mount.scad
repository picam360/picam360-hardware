
$fn=100;
module motor_mount(){
    motor_radius = 35;
    motor_height = 15;
    attach_hole_dimention = 41.8;
    motormax_radius = 48;
    difference(){
        intersection(){
            cylinder(r=motormax_radius/2,h=motor_height+2);
            translate([0,0,-25])
            sphere(r=46);
        }
        translate([0,0,5])
        difference(){
            cylinder(r=motormax_radius/2+1,h=motor_height+2);
            cylinder(r=motor_radius/2+2,h=motor_height+2);
        }
        translate([0,0,-0.1])
        cylinder(r=(motor_radius+1)/2+0.1,h=motor_height);
        translate([50+6,0,0])
        cube([100,100,100],center=true);
        translate([-50-6,0,0])
        cube([100,100,100],center=true);
        cylinder(r=2.5/2,h=100,center=true);
        
        translate([0,attach_hole_dimention/2,-0.1])
        cylinder(r=1.7/2,h=6);
        translate([0,-attach_hole_dimention/2,-0.1])
        cylinder(r=1.7/2,h=6);
    }
}

motor_mount();