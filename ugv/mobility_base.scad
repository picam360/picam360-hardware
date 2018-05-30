
$fn=100;
battery_type = 0;
wall_thick=2;
base_thick=2;
motor_pos=124;
motor_dim=[22.5,18.7]+[0.5,0.5];
raspi_hole_dim=[56-7,65-7];
raspi_dim=[56,85];

battery_space_dim=(battery_type==0)?[64,64,29.5+1.04]:[61.5,75.5,23.5];
upper_h=13.52;
bottom_h=battery_space_dim.z-upper_h;
battery_case_dim=(battery_type==0)?[57.5,63.5,29]+[0.5,0.5,0.5]:[75,61,23]+[0.5,0.5,0.5];
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
module mobility_base_bottom(){
    intersection(){
        cube([100,100,140],center=true);
        difference()
        {
            union()
            {
                difference()
                {
                    union()
                    {
                        outer_dim=battery_space_dim+[2*wall_thick,2*wall_thick];
                        linear_extrude(height=bottom_h+base_thick){
                            minkowski_square(outer_dim,r=3,center=true);
                        }
                        //motor
                        for(i=[0:3])
                        {
                            rotate(i*90+45)
                            translate([0,motor_pos/2,0])
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
                    translate([0,0,base_thick+0.01])
                    linear_extrude(height=battery_space_dim.z){
                        minkowski_square(battery_space_dim,r=0.1,center=true);
                    }
                    
                    //motor
                    translate([0,0,-0.01])
                    for(i=[0:3])
                    {
                        rotate(i*90+45)
                        translate([0,motor_pos/2,base_thick])
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
                            translate([i*8.5,-motor_dim.y/2-wall_thick/2,31.5])
                            rotate([90,0,0])
                            cylinder(r1=3.5/2,r2=5.5/2,h=wall_thick+0.04,center=true);
                        }
                    }
                }
                //hold
                for(i=[-1,1])
                    translate([i*battery_space_dim.x/3,0,(bottom_h+base_thick)/2])
                    cube([2,battery_space_dim.y+wall_thick*2,bottom_h+base_thick],center=true);
                
                for(i=[-1,1])
                    translate([0,i*battery_space_dim.y/6,(bottom_h+base_thick)/2])
                    cube([battery_space_dim.x+wall_thick*2,2,bottom_h+base_thick],center=true);
            
                //attachment
                for(i=[-1,1])
                translate([i*(battery_space_dim.x/2+wall_thick),0,bottom_h+base_thick])
                rotate([90,0,i*90])
                {
                    intersection()
                    {
                        union(){
                            cylinder(r=10/2,h=6);
                            scale([1.5,1,1])
                            translate([0,0,3])
                            cylinder(r=8/2,h=3);
                        }
                        translate([0,-100/2,0])
                        cube([100,100,100],center=true);
                    }
                }
            }
            
            //battery case
            translate([0,0,battery_case_dim.z/2+base_thick+0.02])
            battery_case();
        }
    }
        
}
module mobility_base_upper(){
    raspi_offset=raspi_dim.y/2-(raspi_hole_dim.y+7)/2;
    difference()
    {
        union()
        {
            //raspi base
            translate([0,0,base_thick/2+battery_space_dim.z+base_thick])
            linear_extrude(height=base_thick,center=true){
                minkowski_square(raspi_dim,center=true);
            }
            //raspi hole
            for(y=[-raspi_hole_dim.y/2+raspi_offset,raspi_hole_dim.y/2+raspi_offset])
            for(x=[-raspi_hole_dim.x/2,raspi_hole_dim.x/2])
            translate([x,y,battery_space_dim.z+base_thick+base_thick])
            {
                translate([0,0,-3/2])
                cylinder(r=8.5/2,h=3+0.02,center=true);
            }
            difference()
            {
                union()
                {
                    outer_dim=battery_space_dim+[2*wall_thick,2*wall_thick];
                    translate([0,0,bottom_h+base_thick])
                    linear_extrude(height=upper_h+base_thick){
                        minkowski_square(outer_dim,r=3,center=true);
                    }
                }
                
                //battery
                translate([0,0,base_thick+0.01])
                linear_extrude(height=battery_space_dim.z){
                    minkowski_square(battery_space_dim,r=0.1,center=true);
                }
            }
            //hold
            for(i=[-1,1])
                translate([i*battery_space_dim.x/6,0,battery_space_dim.z+base_thick*2-(upper_h+base_thick)/2])
                cube([2,battery_space_dim.y+wall_thick*2,upper_h+base_thick],center=true);
            for(i=[-1,1])
                translate([0,i*battery_space_dim.y/6,battery_space_dim.z+base_thick*2-(upper_h+base_thick)/2])
                cube([battery_space_dim.x+wall_thick*2,2,upper_h+base_thick],center=true);
            
            //attachment
            for(i=[-1,1])
            translate([i*(battery_space_dim.x/2+wall_thick),0,bottom_h+base_thick])
            rotate([90,0,i*90])
            {
                intersection()
                {
                    union(){
                        cylinder(r=10/2,h=6);
                        scale([1.5,1,1])
                        translate([0,0,3])
                        cylinder(r=8/2,h=3);
                    }
                    translate([0,100/2,0])
                    cube([100,100,100],center=true);
                }
            }
        }
        
        //battery case
        translate([0,0,battery_case_dim.z/2+base_thick+0.02])
        battery_case(offset=10);
        
        //raspi hole
        for(y=[-raspi_hole_dim.y/2+raspi_offset,raspi_hole_dim.y/2+raspi_offset])
        for(x=[-raspi_hole_dim.x/2,raspi_hole_dim.x/2])
        translate([x,y,battery_space_dim.z+base_thick-1+1.5])
        {
            translate([0,0,-100/2])
            cylinder(r=5/2,h=100,center=true);
            translate([0,0,100/2])
            cylinder(r=3/2,h=100.02,center=true);
        }
    }
}
module mobility_base_attachment(){
    for(i=[-1,1])
    translate([0,i*9,0])
    cylinder(r=5/2,h=8);
    difference()
    {
        margin=0.3;
        scale([1,1.55,1])
        cylinder(r=15/2,h=3-margin);
        union(){
            cylinder(r=10/2+margin,h=100,center=true);
            scale([1,1.5,1])
            cylinder(r=8/2+margin,h=100,center=true);
        }
    }
}

module battery_case(offset=0)
{
    rotate([90,0,0])
    linear_extrude(height=battery_case_dim.x,center=true){
        minkowski_square([battery_case_dim.y,battery_case_dim.z],r=5,center=true);
    }
    
    //connector slit
    if(battery_type == 0){
        translate([battery_case_dim.y/4,battery_case_dim.x/2+6/2,battery_case_dim.z/2-13/2+0.5-offset/2])
        rotate([90,0,0])
        linear_extrude(height=6.02,center=true){
            minkowski_square([24.7,13-0.02+offset],r=2,center=true);
        }
    }else{
        translate([0,battery_case_dim.x/2+6/2,battery_case_dim.z/2-13/2-offset/2])
        rotate([90,0,0])
        linear_extrude(height=6.02,center=true){
            minkowski_square([54,13-0.02+offset],r=2,center=true);
        }
    }
}

type=0;
if(type==0){
    //battery case
    color([0.2,0.2,0.2])
    translate([0,0,battery_case_dim.z/2+base_thick])
    battery_case();
    
    color([0,1,0])
    translate([0,0,40])
        minkowski_square(raspi_dim,center=true);
    
    for(i=[-1,1])
    translate([i*(battery_space_dim.x/2+wall_thick),0,bottom_h+base_thick])
    rotate([90,90,i*90])
    mobility_base_attachment();
    
    intersection(){
        //translate([100/2,0,0])
        cube([100,100,140],center=true);
        union(){
            color([1,0,0])
            mobility_base_bottom();
            mobility_base_upper();
        }
    }
}else if(type==1){
    //battery case
    color([0.2,0.2,0.2])
    translate([0,0,battery_case_dim.z/2+base_thick])
    battery_case();
    
    color([0,1,0])
    translate([0,0,40])
        minkowski_square(raspi_dim,center=true);
    
    for(i=[-1,1])
    translate([i*(battery_space_dim.x/2+wall_thick),0,bottom_h+base_thick])
    rotate([90,0,i*90])
    mobility_base_attachment();
    
    intersection(){
        //translate([100/2,0,0])
        cube([100,100,140],center=true);
        union(){
            color([1,0,0])
            mobility_base_bottom();
            mobility_base_upper();
        }
    }
}else if(type==2){
    mobility_base_upper();
}else{
    mobility_base_bottom();
}