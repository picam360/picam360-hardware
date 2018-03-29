
$fn=100;
wall_thick=2;
base_thick=2;
motor_dim=[22.5,18.7]+[0.5,0.5];
raspi_hole_dim=[56-7,65-7];
raspi_dim=[56,85];
battery_case_dim=[72,96,19.5]+[0.5,0.5,0.5];
module  minkowski_square(dimension, r=2,center=false)
{   
    minkowski()
    {
        if(center){
            square([dimension.x-r*2,dimension.y-r*2],center=true);
        }else{
            translate([r, r])
            square([dimension.x-r*2,dimension.y-r*2]);
        }
        circle(r=r);
    }
}
module mobility_base(){
    raspi_offset=raspi_dim.y/2-(raspi_hole_dim.y+3.5)/2;
    difference()
    {
        union()
        {
            outer_dim=battery_case_dim+[2*wall_thick,2*wall_thick];
            linear_extrude(height=battery_case_dim.z+base_thick){
                minkowski_square(outer_dim,r=3,center=true);
            }
            //raspi hole
            for(y=[-raspi_hole_dim.y/2+raspi_offset,raspi_hole_dim.y/2+raspi_offset])
            for(x=[-raspi_hole_dim.x/2,raspi_hole_dim.x/2])
            translate([x,y,battery_case_dim.z+base_thick])
            {
                translate([0,0,5/2])
                cylinder(r=8.5/2,h=5,center=true);
            }
            //motor
            for(i=[0:3])
            {
                rotate(i*90+45)
                translate([0,150/2,0])
                {
                    linear_extrude(height=5){
                        translate([0,-30/2-0.01])
                        minkowski_square(motor_dim+[2*wall_thick,30],r=1,center=true);
                    }
                    linear_extrude(height=38){
                        translate([0,-wall_thick/2-0.01])
                        minkowski_square(motor_dim+[2*wall_thick,wall_thick],r=1,center=true);
                    }
                }
            }
        }
        //battery
        translate([0,0,-0.01])
        linear_extrude(height=battery_case_dim.z){
            minkowski_square(battery_case_dim,r=0.1,center=true);
        }
        
        //motor
        translate([0,0,-0.01])
        for(i=[0:3])
        {
            rotate(i*90+45)
            translate([0,150/2,base_thick])
            {
                linear_extrude(height=100){
                    minkowski_square(motor_dim,r=0.1,center=true);
                }
                translate([0,1.5/2,0])
                linear_extrude(height=100,center=true){
                    minkowski_square([5,2.5]+[1,1],r=1,center=true);
                }
                translate([0,0,16])
                minkowski()
                {
                    cube([0.01,0.01,18-7.5],center=true);
                    rotate([90,0,0])
                    cylinder(r=7.5/2,h=25,center=true);
                }
                
                for(i=[-1,1])
                translate([i*8.5,-motor_dim.y/2-1.5/2,31.5])
                rotate([90,0,0])
                cylinder(r1=3.5/2,r2=5.5/2,h=1.6,center=true);
            }
        }
        
        //battery holder
        for(i=[-1,1])
        translate([i*20/2,0,-100/2+15])
        cube([2,200,100],center=true);
        
        //hold slit
        translate([-battery_case_dim.x/2,0,-100/2])
        minkowski()
        {
            cube([0.01,0.01,100],center=true);
            rotate([90,0,90])
            cylinder(r=15/2,h=10,center=true);
        }
        //cable slit
        translate([battery_case_dim.x/2,9,-100/2+15])
        minkowski()
        {
            cube([0.01,0.01,100],center=true);
            rotate([90,0,90])
            cylinder(r=4/2,h=10,center=true);
        }
        //switch slit
        translate([battery_case_dim.x/2,35,-100/2+11])
        minkowski()
        {
            cube([0.01,7,100],center=true);
            rotate([90,0,90])
            cylinder(r=1/2,h=6,center=true);
        }
        
        //raspi hole
        for(y=[-raspi_hole_dim.y/2+raspi_offset,raspi_hole_dim.y/2+raspi_offset])
        for(x=[-raspi_hole_dim.x/2,raspi_hole_dim.x/2])
        translate([x,y,battery_case_dim.z+base_thick])
        {
            translate([0,0,100/2])
            cylinder(r=6/2,h=100,center=true,$fn=6);
        }
    }
        
    //battery holder
    for(i=[-1,1])
    mirror([0,i+1,0])
    translate([0,battery_case_dim.y/2,2/2])
    rotate([90,30,90])
    cylinder(r=2,h=20-2,$fn=3,center=true);
}

if(false){
        translate([0,0,50])
            minkowski_square(raspi_dim,center=true);
mobility_base();
}else{
    intersection(){
        cube([120,120,140],center=true);
        mobility_base();
    }
}