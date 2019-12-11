use<../../camera_pod/base_seal.scad>

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}
module pod_inner_60mm_fix(dome_dia=50.8, outer_dia=60, inner_dia=44, 
        tube_thick=2, shift_x=6, shift_y=0, seal_margin=0.4)
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
    heat_sink_plate_h = 1.5;
    
    battery_cell_r = 19;
    battery_margin_h = 4;//BMS or hold tape
    battery_w = 70;
    battery_h = battery_cell_r*6;
    battery_d = battery_cell_r*2+battery_margin_h;
    
    difference(){
        linear_extrude(height=2)
        difference(){
            union(){
                difference(){
                    circle(r=outer_dia/2-tube_thick-seal_margin);
                    circle(r=19+4.5/2, center=true);
                }
                intersection(){
                    translate([0, 8])
                    minkowski_square(dimension=[46+6,2+6], r=0.8);
                    circle(r=outer_dia/2-tube_thick-seal_margin);
                }
            }
            translate([0, 8])
            minkowski_square(dimension=[46+0.5,2+0.5], r=0.8);
            square([28,28], center=true);
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

module pod_inner_60mm(dome_dia=50.8, outer_dia=60, inner_dia=44, tube_thick=2, seal_margin=0.4)
{
    tube_h=160;
    height=tube_h-15*2;
    bolt_r = 1.7/2;
    h=15;//need to be ajust for lens height
    
    difference()
    {
        union(){
            difference()
            {
                translate([0, 8, height/2])
                linear_extrude(height=height, center=true)
                minkowski_square(dimension=[46,2], r=0.8);
                translate([8, 0, height/2+40])
                rotate([90,0,0])
                linear_extrude(height=height, center=true)
                minkowski_square(dimension=[10,20], r=5-0.01);
            }
            
            difference()
            {
                translate([-8, 0, height/2]) 
                rotate([0,0,90])
                linear_extrude(height=height, center=true)
                minkowski_square(dimension=[46,2], r=0.8);
                translate([0,100/2+8+2/2-0.01])
                cube([100,100,1000], center=true);
            }
            
            intersection()
            {
                union(){
                    //raspi
                    translate([8, 8-2/2, height/2-25])
                    rotate([90,0,0])
                        for(i=[0:1]){
                            mirror([i,0])
                                for(j=[0:1]){
                                    mirror([0,j])
                                        translate([30/2-3.5, 65/2-3.5])
                                        cylinder(r1=4.5,r2=3,h=2);
                                }
                        }
                }
                translate([8-0.5,0])
                cube([30,100,1000], center=true);
            }
        }
        union(){
            //raspi
            translate([8, 8, height/2-25])
            rotate([90,0,0])
                for(i=[0:1]){
                    mirror([i,0])
                        for(j=[0:1]){
                            mirror([0,j])
                                translate([30/2-3.5, 65/2-3.5])
                            cylinder(r=bolt_r,h=100,center=true);
                        }
                }
        }
            translate([-100/2-8-2/2,0,height/2])
            cube([100,100,100], center=true);
            translate([0,-100/2+8-2/2-(11+2+1.6*2),height/2])
            cube([100,100,100], center=true);
    }
}
$fn=360;
 
is_fix=false;
if(is_fix){
    pod_inner_60mm_fix();
    //pod_inner_60mm();
}else{
    pod_inner_60mm();
}
if(false){
    
    translate([0,0,-5])
    base_seal(tube_dia=60);
}
//raspi
if(false){
    translate([8,-8,40])
    color([0,1,0])
    cube([30,10+11+1.6*2,65],center=true);
}