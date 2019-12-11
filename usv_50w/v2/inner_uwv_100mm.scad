use<../../camera_pod/base_seal.scad>

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}
module line_taper(r=5,l=5)
{
    //translate([-r/2,0,r])
    rotate([0,90,180])
    translate([-r,-r,-l/2])
    difference(){
        cube([r,r,l]);
        translate([0,0,-0.01])
        cylinder(r=r,h=l+0.02);
    }
}
module pod_inner_100mm_fix(dome_dia=50.8, outer_dia=60, inner_dia=44, 
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
        translate([-shift_x,-shift_y,0])
        linear_extrude(height=2)
        minkowski_square(dimension=[battery_w-0.5,battery_d-0.5], r=3, $fn=100);
        
        rotate([0,0,45])
        union(){
            ary=4;
            step=8;
            for(i=[0:ary-1])
            {
                for(j=[0:ary-1])
                {
                    translate([(j-(ary/2-0.5))*step, (i-(ary/2-0.5))*step, -0.01])
                        cylinder(r=4.5/2, h=h+.02);
                }
            }
            camera_bolt_r = 2.1/2;
            for(i=[0:7]){
                r=34*sqrt(2)/2;
                translate([r*cos((i+0.0)*360/8), r*sin((i+0.0)*360/8), 0])
                    cylinder(r=camera_bolt_r, h=100, center=true);
            }
            for(i=[0:3]){
                rotate(i*90)
                translate([19, 0, -0.01])
                cylinder(r=4.5/2, h=h+.02);
            }
        }
    }
}

module pod_inner_100mm(dome_dia=50.8, outer_dia=60, inner_dia=44, 
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
    
    
    translate([-shift_x,-shift_y,0])
    linear_extrude(height=0.4)
    difference(){
        minkowski_square(dimension=[battery_w+4,battery_d+4], r=3, $fn=100);
        //minkowski_square(dimension=[battery_w,battery_d], r=3, $fn=100);
    }
    //translate([0, -battery_cell_r-heat_sink_plate_h-thick/2, outer_h/2])
    //rotate([90,0,0])
    translate([-shift_x,-shift_y,0])
    difference()
    {
        union(){
            linear_extrude(height=height)
            difference(){
                minkowski_square(dimension=[battery_w+4,battery_d+4], r=3, $fn=100);
                minkowski_square(dimension=[battery_w,battery_d], r=3, $fn=100);
            }
            //charger
            translate([0,-23,height/2])
            rotate([90,0,0])
                for(i=[0:1]){
                    mirror([i,0])
                        for(j=[0:1]){
                            mirror([0,j])
                            {
                                translate([68.5/2-9, 112.5/2-3])
                                    cylinder(r1=4.5,r2=3,h=2);
                            }
                        }
                }
            //charger
            translate([shift_x,-23,height/2])
            difference(){
                rotate([90,0,0])
                for(i=[0:1]){
                    mirror([i,0])
                        for(j=[0:1]){
                            mirror([0,j])
                            {
                                translate([65.5/2-5, 100/2-4.5])
                                    cylinder(r1=4.5,r2=3,h=2);
                            }
                        }
                }
                translate([200/2+30.3,0,0])
                cube([200,200,200],center=true);
            }
            //esc
            translate([-17,0,-7])
            translate([0,23,height/2+40])
            rotate([-90,0,0])
                for(i=[0:1]){
                    mirror([i,0])
                        for(j=[0:1]){
                            mirror([0,j])
                                translate([27/2-3.5, 27/2-3.5, 0])
                                    cylinder(r1=4.5,r2=3,h=2);
                        }
                }
            //pmb
            translate([-17,0,-7])
            translate([0,23,height/2-22])
            rotate([-90,0,0])
                for(i=[0:1]){
                    mirror([i,0])
                        for(j=[0:1]){
                            mirror([0,j])
                                translate([30/2-3.5, 65/2-3.5])
                                cylinder(r1=5,r2=3,h=2);
                        }
                }
            //opt1
            translate([37,0,height/2+40])
            rotate([90,0,90])
                for(i=[0:1]){
                    mirror([i,0])
                        for(j=[0:1]){
                            mirror([0,j])
                                translate([27/2-3.5, 27/2-3.5, 0])
                                    cylinder(r1=4.5,r2=3,h=2);
                        }
                }
            //opt2
            translate([37,0,height/2-22])
            rotate([90,0,90])
                for(i=[0:1]){
                    mirror([i,0])
                        for(j=[0:1]){
                            mirror([0,j])
                                translate([30/2-3.5, 65/2-3.5])
                                cylinder(r1=5,r2=3,h=2);
                        }
                }
            //plc
            translate([17,0,-7])
            translate([0,23,height/2+40])
            rotate([-90,0,0])
                for(i=[0:1]){
                    mirror([i,0])
                        for(j=[0:1]){
                            mirror([0,j])
                                translate([27/2-3.5, 27/2-3.5, 0])
                                    cylinder(r1=4.5,r2=3,h=2);
                        }
                }
            //raspi
            translate([17,0,-7])
            translate([0,23,height/2-22])
            rotate([-90,0,0])
                for(i=[0:1]){
                    mirror([i,0])
                        for(j=[0:1]){
                            mirror([0,j])
                                translate([30/2-3.5, 65/2-3.5])
                                cylinder(r1=5,r2=3,h=2);
                        }
                }
        }
        
        //cable
        translate([shift_x,0,0])
        union(){
            translate([0,0,0])
            rotate([90,0,0])
                cylinder(r=16/2, h=100, center=false);
            translate([0,0,height])
            rotate([90,0,0])
                cylinder(r=16/2, h=100, center=true);
        }
        
        //charger
        translate([shift_x,-battery_d/2-0.5,height/2])
        rotate([90,0,0])
            linear_extrude(height=100)
            intersection(){
                square(size=[55,100], center=true);
                circle(r=97/2);
            }
        translate([0,0,height/2])
        rotate([90,0,0])
            for(i=[0:1]){
                mirror([i,0])
                    for(j=[0:1]){
                        mirror([0,j])
                        {
                            translate([68.5/2-9, 112.5/2-3])
                                cylinder(r=m3_r,h=100);
                        }
                    }
            }
        translate([shift_x,-18.5,height/2])
        rotate([90,0,0])
            for(i=[0:1]){
                mirror([i,0])
                    for(j=[0:1]){
                        mirror([0,j])
                        {
                            translate([65.5/2-5, 100/2-4.5])
                                cylinder(r=m3_r,h=100);
                        }
                    }
            }
        translate([0,0,height/2])
        rotate([-90,0,0])
            for(i=[0:1]){
                mirror([i,0])
                    for(j=[0:1]){
                        mirror([0,j])
                        {
                            translate([68.5/2-9, 112.5/2-3])
                                cylinder(r=6/2,h=100);
                        }
                    }
            }
            
        //esc
        translate([-17,0,-7])
        translate([0,0,height/2+40])
        rotate([-90,0,0])
            for(i=[0:1]){
                mirror([i,0])
                    for(j=[0:1]){
                        mirror([0,j])
                            translate([27/2-3.5, 27/2-3.5, 0])
                                cylinder(r=1.7/2,h=100);
                    }
            }
        //pmb
        translate([-17,0,-7])
        translate([0,0,height/2-22])
        rotate([-90,0,0])
            for(i=[0:1]){
                mirror([i,0])
                    for(j=[0:1]){
                        mirror([0,j])
                            translate([30/2-3.5, 65/2-3.5])
                                cylinder(r=1.7/2,h=100);
                    }
            }
        //opt1
        translate([0,0,height/2+40])
        rotate([90,0,90])
            for(i=[0:1]){
                mirror([i,0])
                    for(j=[0:1]){
                        mirror([0,j])
                            translate([27/2-3.5, 27/2-3.5, 0])
                                cylinder(r=1.7/2,h=100);
                    }
            }
        //opt2
        translate([0,0,height/2-22])
        rotate([90,0,90])
            for(i=[0:1]){
                mirror([i,0])
                    for(j=[0:1]){
                        mirror([0,j])
                            translate([30/2-3.5, 65/2-3.5])
                                cylinder(r=1.7/2,h=100);
                    }
            }
        //plc
        translate([17,0,-7])
        translate([0,0,height/2+40])
        rotate([-90,0,0])
            for(i=[0:1]){
                mirror([i,0])
                    for(j=[0:1]){
                        mirror([0,j])
                            translate([27/2-3.5, 27/2-3.5, 0])
                                cylinder(r=1.7/2,h=100);
                    }
            }
        //raspi
        translate([17,0,-7])
        translate([0,0,height/2-22])
        rotate([-90,0,0])
            for(i=[0:1]){
                mirror([i,0])
                    for(j=[0:1]){
                        mirror([0,j])
                            translate([30/2-3.5, 65/2-3.5])
                                cylinder(r=1.7/2,h=100);
                    }
            }
    }
}
$fn=120;
is_fix=false;
part=0;
if(is_fix){
    pod_inner_100mm_fix();
    //pod_inner_100mm();
//}else if(part == 1){
//    difference(){
//        import("inner_uwv_100mm.stl");
//        translate([1000/2+17-6,0,0])
//        cube([1000,1000,1000],center=true);
//    }
//}else if(part == 2){
//    intersection(){
//        import("inner_uwv_100mm.stl");
//        translate([1000/2+17-6,0,0])
//        cube([1000,1000,1000],center=true);
//    }
}else{
        pod_inner_100mm();
}

if(false){
    translate([0,0,-5])
    rotate([0,0,45])
    base_seal(tube_dia=100);

    translate([12,32,40])
    color([0,1,0])
    cube([30,11+1.6*2,65],center=true);

    translate([-24,26+6/2,40])
    color([0,1,0])
    cube([20,1.6+6,65],center=true);

    translate([34+5,0,40])
    color([0,1,0])
    rotate([0,0,90])
    cube([25,10+1.6,65],center=true);
}
//raspi
if(false){
    color(GREEN)
    translate([0,-26.5,68])
    rotate([90,0,0])
    linear_extrude(height=2, center=true)
    minkowski_square(dimension=[65.5,100], r=3, $fn=100);
}
if(false){
    color([0.5,0.5,0.5,0.5])
    difference(){
        cylinder(r=100/2,h=160);
        translate([0,0,-0.01])
        cylinder(r=100/2-2,h=160.2);
    }
}