use<../../camera_pod/base_seal.scad>

thick=2;
heat_sink_plate_h = 1.5;
battery_cell_r = 19;
battery_margin_h = 4;//BMS or hold tape
battery_w = 66+0.5+0.5+3.0;//70mm is required for charger plate
battery_h = battery_cell_r*6;
battery_d = battery_cell_r*2+0.5+heat_sink_plate_h+0.5+0.5+1.0-3.0;

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
        translate([0, 0, -0.01])
        cylinder(r=38.5/2, h=h+.02);
    }
}
module charger_base_set(height, r1=4.5, r2=3, h=2, center=false, shift_x=6)
{
    //charger
    translate([0,-(battery_d/2+thick),height/2])
    rotate([90,0,0])
        for(i=[0:1]){
            mirror([i,0])
                for(j=[0:1]){
                    mirror([0,j])
                    {
                        translate([68.5/2-9, 112.5/2-3])
                            cylinder(r1=r1,r2=r2,h=h,center=center);
                    }
                }
        }
    //charger
    translate([shift_x,-(battery_d/2+thick),height/2])
    difference(){
        rotate([90,0,0])
        for(i=[0:1]){
            mirror([i,0])
                for(j=[0:1]){
                    mirror([0,j])
                    {
                        if(center){
                            translate([65.5/2-5, 100/2-4.5, h/2-thick-1])
                            cylinder(r1=r1,r2=r2,h=h+1,center=center);
                        }else{
                            translate([65.5/2-5, 100/2-4.5, -2])
                            cylinder(r1=r1+1,r2=r2,h=h+2,center=center);
                        }
                    }
                }
        }
        translate([200/2+37-shift_x,0,0])
        cube([200,200,200],center=true);
    }
}
module base_set1(height, r1=4.5, r2=3, h=2, center=false)
{
    //plc
    translate([0,(battery_d/2+thick),height/2+40])
    rotate([-90,0,0])
        for(i=[0:1]){
            mirror([i,0])
                for(j=[0:1]){
                    mirror([0,j])
                        translate([27/2-3.5, 27/2-3.5, 0])
                            cylinder(r1=r1,r2=r2,h=h,center=center);
                }
        }
    //raspi
    translate([0,(battery_d/2+thick),height/2-22])
    rotate([-90,0,0])
        for(i=[0:1]){
            mirror([i,0])
                for(j=[0:1]){
                    mirror([0,j])
                        translate([30/2-3.5, 65/2-3.5])
                            cylinder(r1=r1,r2=r2,h=h,center=center);
                }
        }
}
module base_set2(height, r1=4.5, r2=3, h=2, center=false)
{
    //esc
    translate([-18,0,-10])
    translate([0,(battery_d/2+thick),height/2+48])
    rotate([-90,0,0])
        for(i=[0:1]){
            mirror([i,0])
                for(j=[0:1]){
                    mirror([0,j])
                        translate([27/2-3.5, 27/2-3.5, 0])
                        if(center){
                            cylinder(r1=r1,r2=r2,h=h,center=center);
                        }else{
                            cylinder(r1=r1-1.5,r2=r2-1.5,h=h,center=center);
                        }
                }
        }
    //pmb
    translate([-18,0,-2])
    translate([0,(battery_d/2+thick),height/2-15])
    rotate([-90,0,0])
        for(i=[0:1]){
            mirror([i,0])
                for(j=[0:1]){
                    mirror([0,j])
                        translate([30/2-3.5, 65/2-3.5])
                        cylinder(r1=r1,r2=r2,h=h,center=center);
                }
        }
    //raspi
    translate([-5,0,0])
    translate([18,0,-2])
    translate([0,(battery_d/2+thick),height/2-15])
    rotate([-90,0,0])
        for(i=[0:1]){
            mirror([i,0])
                for(j=[0:1]){
                    mirror([0,j])
                        translate([30/2-3.5, 65/2-3.5])
                        cylinder(r1=r1,r2=r2,h=h,center=center);
                }
        }
    //usb hub
    difference(){
        translate([(battery_w/2+thick)-1.5,4,height/2+7])
        rotate([90,0,90])
            for(i=[0:1])
                mirror([i,0])
                for(j=[0:1])
                        mirror([0,j])
                            translate([34.0/2-2.0,79.5/2-2.5,0])
                                cylinder(r1=r1,r2=r2,h=h+1.5,center=center);
        translate([0,200/2+21.5,height/2])
        cube([200,200,200],center=true);
    }
}

module pod_inner_100mm(dome_dia=50.8, outer_dia=60, inner_dia=44, 
        tube_thick=2, shift_x=6, shift_y=0, seal_margin=0.4)
{
    tube_h=160;
    height=tube_h-15*2;
    
    m3_r = 2.8/2;
    m3t_r = 3.2/2;
    bolt_r = 1.7/2;
    h=15;//need to be ajust for lens height
    
    translate([-shift_x,-shift_y,0])
    linear_extrude(height=0.4)
    difference(){
        minkowski_square(dimension=[battery_w+thick*2,battery_d+thick*2], r=2, $fn=100);
        //minkowski_square(dimension=[battery_w,battery_d], r=2, $fn=100);
    }
    translate([-shift_x,-shift_y,0])
    difference()
    {
        union(){
            linear_extrude(height=height)
            difference(){
                minkowski_square(dimension=[battery_w+4,battery_d+4], r=2, $fn=100);
                minkowski_square(dimension=[battery_w,battery_d], r=2, $fn=100);
            }
            charger_base_set(height=height, r1=4.5, r2=3, h=2, center=false, shift_x=shift_x);
            base_set2(height=height, r1=4, r2=3, h=1.5, center=false);
        }
        
        //cable
        translate([shift_x,0,0])
        union(){
            translate([0,0,0])
            rotate([90,0,0])
                cylinder(r=16/2, h=100, center=true);
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
        //charger
        translate([0,0,height/2])
        rotate([-90,0,0])
        for(i=[0:1]){
            mirror([i,0])
                for(j=[0:1]){
                    mirror([0,j])
                    {
                        translate([68.5/2-9, 112.5/2-3])
                            cylinder(r1=6/2,r2=6/2,h=100);
                    }
                }
        }
            
        charger_base_set(height=height, r1=2.7/2, r2=2.7/2, h=20, center=true, shift_x=shift_x);
        base_set2(height=height, r1=1.7/2, r2=1.7/2, h=20, center=true);
    }
}
$fn=120;
is_fix=false;
shift_x=0;
//shift_x=6;//uwv
if(is_fix){
    pod_inner_100mm_fix(shift_x=shift_x);
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
        pod_inner_100mm(shift_x=shift_x);
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