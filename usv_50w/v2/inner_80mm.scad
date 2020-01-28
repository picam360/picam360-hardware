use<../../camera_pod/base_seal.scad>

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}
module pod_inner_80mm_fix(dome_dia=50.8, outer_dia=60, inner_dia=44, 
        tube_thick=2, seal_margin=0.4)
{
    tube_h=160;
    height=tube_h-15*2;
    
    thick=3;
    m3_r = 2.8/2;
    m3t_r = 3.2/2;
    bolt_r = 1.7/2;
    h=15;//need to be ajust for lens height
    battery_box_w = 73+2*2;
    outer_w = battery_box_w+3*2;
    esc_h=10;
    outer_h = 116+esc_h;
    
    shift_raspi_h=8;
    shift_raspi_x=8;
    
    difference(){
        linear_extrude(height=3)
        difference(){
            circle(r=outer_dia/2-tube_thick-seal_margin);
            circle(r=19+4.5/2);
        }
        union(){
            translate([0, 0, -0.01])
            linear_extrude(height=1.02)
            translate([0, shift_raspi_h])
            minkowski_square(dimension=[46+0.5,thick+0.5], r=0.8);
            hull(){
                translate([0, 0, 3.0])
                linear_extrude(height=0.01)
                translate([0, shift_raspi_h])
                minkowski_square(dimension=[46+0.5+2.5,thick+0.5+2.5], r=0.8);
                    
                translate([0, 0, 1.0])
                linear_extrude(height=1)
                translate([0, shift_raspi_h])
                minkowski_square(dimension=[46+0.5,thick+0.5], r=0.8);
            }
        
            translate([0, 0, -0.01])
            linear_extrude(height=1.02)
            translate([shift_raspi_x,0])
            rotate(-90)
            translate([(46+0.5)/4,0])
            minkowski_square(dimension=[(46+0.5)/2,thick+0.5], r=0.8);
            hull(){
                translate([0, 0, 3])
                linear_extrude(height=0.01)
                translate([shift_raspi_x,0])
                rotate(-90)
                translate([(46+0.5)/4,0])
                minkowski_square(dimension=[(46+0.5)/2+2.5,thick+0.5+2.5], r=0.8);
                
                translate([0, 0, 1.0])
                linear_extrude(height=0.01)
                translate([shift_raspi_x,0])
                rotate(-90)
                translate([(46+0.5)/4,0])
                minkowski_square(dimension=[(46+0.5)/2,thick+0.5], r=0.8);
            }
        }
        
        rotate([0,0,0])
        union(){
            camera_bolt_r = 2.1/2;
            for(i=[0:7]){
                r=34*sqrt(2)/2;
                translate([r*cos((i+0.0)*360/8), r*sin((i+0.0)*360/8), 0])
                    cylinder(r=camera_bolt_r, h=100, center=true);
            }
        }
    }
}

module pod_inner_80mm(dome_dia=50.8, outer_dia=80, inner_dia=44, tube_thick=2, seal_margin=0.4)
{
    thick=3;
    tube_h=160;
    height=tube_h-15*2;
    bolt_r = 1.7/2;
    h=15;//need to be ajust for lens height
    
    shift_raspi_h=8;
    shift_raspi_x=8;
    
    shift_usb_x=4;
    shift_usb_y=0;
    
    difference()
    {
        union(){
            //raspi base
            difference()
            {
                translate([0, shift_raspi_h, height/2])
                linear_extrude(height=height, center=true)
                minkowski_square(dimension=[46,thick], r=0.8);
                //hole
//                translate([shift_raspi_x-3, 0, height/2+40])
//                rotate([90,0,0])
//                linear_extrude(height=height, center=true)
//                minkowski_square(dimension=[10,20], r=5-0.01);
            }
            
            //raspi side
            difference()
            {
                translate([-shift_raspi_x, 0, height/2]) 
                rotate([0,0,90])
                linear_extrude(height=height, center=true)
                minkowski_square(dimension=[46,thick], r=0.8);
                translate([0,100/2+8+2/2-0.01])
                cube([100,100,1000], center=true);
            }
            //usb hub
            translate([-thick/2-shift_raspi_x,shift_usb_x,height/2+shift_usb_y])
            //for(i=[0:1])
                mirror([0,1])
                for(j=[0:1])
                    mirror([0,0,j])
                        translate([0,34.0/2-2.0,79.5/2-2.5])
                        rotate([0,-90,0])
                        cylinder(r1=4.5,r2=3,h=1.5);
            
            intersection()
            {
                union(){
                    //raspi
                    translate([30/2+thick/2-shift_raspi_x, shift_raspi_h-thick/2, height/2])
                    rotate([90,0,0])
                        for(i=[0:1]){
                            mirror([i,0])
                                for(j=[0:1]){
                                    mirror([0,j])
                                        translate([30/2-3.5, 65/2-3.5])
                                        cylinder(r1=4.5,r2=3,h=1.5);
                                }
                        }
                }
                translate([8-0.5,0])
                cube([30,100,1000], center=true);
            }
        }
        union(){
            //raspi
            translate([30/2+thick/2-shift_raspi_x, 0, height/2])
            rotate([90,0,0])
                for(i=[0:1]){
                    mirror([i,0])
                        for(j=[0:1]){
                            mirror([0,j])
                                translate([30/2-3.5, 65/2-3.5])
                            cylinder(r=bolt_r,h=100,center=true);
                        }
                }
            //usb hub
            translate([-9,shift_usb_x,height/2+shift_usb_y])
            //for(i=[0:1])
                mirror([0,1])
                for(j=[0:1])
                    mirror([0,0,j])
                        translate([0,34.0/2-2.0,79.5/2-2.5])
                        rotate([0,-90,0])
                        cylinder(r=1.7/2,h=100,center=true);
        }
            translate([-100/2-shift_raspi_x-thick/2,100/2,height/2])
            cube([100,100,100], center=true);
            translate([0,-100/2+8-2/2-(11+2+1.6*2)-5,height/2])
            cube([100,100,100], center=true);
    }
}
$fn=360;
 
usb_hub=false;
is_fix=false;
if(is_fix){
    mirror([1,0,0])
    pod_inner_80mm_fix();
    //pod_inner_80mm();
}else{
    pod_inner_80mm();
}
//    mirror([1,0])
//    pod_inner_80mm_fix();
if(false){
    translate([0,0,-5])
    base_seal(tube_dia=80);
}
if(usb_hub){
    translate([-16,3,80])
    difference()
    {
        cube([10,34,79.5], center=true);
        translate([0,0,40])
        cube([10.02,34-11*2,10], center=true);
        
        for(i=[0:1])
            mirror([0,i])
            for(j=[0:1])
                mirror([0,0,j])
                    translate([0,34.0/2-2.0,79.5/2-2.5])
                    rotate([0,90,0])
                    cylinder(r=3.5/2, h=100, center=true);
    }
}
//raspi
if(false){
    translate([8,-8,40])
    color([0,1,0])
    cube([30,10+11+1.6*2,65],center=true);
}