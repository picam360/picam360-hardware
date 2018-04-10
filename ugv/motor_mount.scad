
$fn=100;
module motor_mount(){
    motor_radius = 35;
    motor_height = 15;
    flange_height = 0.8;
    attach_hole_dimention = 41.8;
    motormax_radius = 48;
    tickness = 2;
    difference(){
        intersection(){
            cylinder(r=motormax_radius/2,h=motor_height+tickness);
            translate([0,0,-25])
            sphere(r=46);
            scale([1,2.4,1])
            cylinder(r=20/2,h=100);
        }
        translate([0,0,5])
        difference(){
            cylinder(r=motormax_radius/2+1,h=motor_height+2);
            cylinder(r=(motor_radius+0.4)/2+tickness,h=motor_height+2);
        }
        translate([0,0,-0.1])
        cylinder(r=(motor_radius+0.4)/2,h=motor_height);
        translate([50+6,0,0])
        cube([100,100,100],center=true);
        translate([-50-6,0,0])
        cube([100,100,100],center=true);
        cylinder(r=3/2,h=100,center=true);
        
        for(i=[-1,1]){
            translate([0,i*attach_hole_dimention/2,-0.1])
            cylinder(r=1.5/2,h=6);
        }
        translate([0,0,flange_height/2])
        cylinder(r=100,h=flange_height+0.01,center=true);
    }
}

motor_mount();