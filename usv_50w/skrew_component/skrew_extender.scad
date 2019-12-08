//include<params.scad>

use <../../lib/ISOThread.scad>;

module thruster()
{
    rotate(45)
    translate([-48.4,-50,-40])
    import("T100-Thruster-R1-Public.stl");
                for(angle=[0,90,180,270])
                rotate(angle)
                {
                    rotate([90,0,135])
                    rotate([0,0,45])
                    for(i=[0:1]){
                        mirror([i,0])
                            for(j=[0:1]){
                                mirror([0,j])
                                {
                                    translate([13.5/2,13.5/2])
                                        cylinder(r=3/2,h=100);
                                }
                            }
                    }
                }
}
module skrew_mount(dome_dia=50.8, outer_dia=108, inner_dia=100, tube_thick=2, margin=0.4)
{
    pod_space_h = 50;
    thread_h = 10;
    taper_h = 2;
    taper2_h = 2;
    m3th_r = 3.1;
    m3bo_r = 7.7;
    union(){
        difference(){
            union(){
                translate([0,0,thread_h+taper_h])
                cylinder(r=outer_dia/2, h=pod_space_h-taper_h-taper2_h);
                translate([0,0,thread_h+pod_space_h/2])
        
                for(angle=[0,90,180,270])
                rotate(angle)
                {
                        rotate([90,0,135])
                        translate([0,0,2*outer_dia/3/2])
                        cylinder(r1=80/2, r2=40/2, h=outer_dia/3/2+3);
                }
            }
            cylinder(r=inner_dia/2+margin, h=200, center=true);
            translate([0,0,thread_h+pod_space_h/2])
            for(angle=[0,90,180,270])
            rotate(angle)
            {
                rotate([90,0,135])
                rotate([0,0,45])
                for(i=[0:1]){
                    mirror([i,0])
                        for(j=[0:1]){
                            mirror([0,j])
                            {
                                translate([13.5/2,13.5/2])
                                    cylinder(r=m3th_r/2,h=100);
                                translate([13.5/2,13.5/2])
                                    cylinder(r=m3bo_r/2,h=outer_dia/2);
                            }
                        }
                }
            }
        }
    }
}
module skrew_extender()
{
    difference(){
        intersection(){
            translate([0,0,0])
            rotate([90,0,0])
            linear_extrude(height=40, center=true)
            union(){
                radius=10;
                points_up_round = [
                    for(a = [90:-1:0]) [radius * cos(a), radius * sin(a)+30]
                ];
                points_middle_round = [
                    for(a = [180:1:270]) [radius * cos(a)+20, radius * sin(a)+20]
                ];
                points_bottom_round = [
                    for(a = [90:-1:0]) [radius * cos(a)+60, radius * sin(a)]
                ];
                polygon(concat([[0, 0]], points_up_round, points_middle_round, points_bottom_round));
            }
            translate([0,0,20])
            rotate([0,90,0])
            cylinder(r1=40/2,r2=88/2,h=200);
        }
        union(){
            m3th_r = 3.3;
            m3bo_r = 8.0;
            translate([53,0,0])
            rotate([0,0,45])
            for(i=[0:1]){
                mirror([i,0])
                    for(j=[0:1]){
                        mirror([0,j])
                        {
                            translate([13.5/2,13.5/2,-0.01])
                                cylinder(r=m3th_r/2,h=100);
                            translate([13.5/2,13.5/2,2])
                                cylinder(r=m3bo_r/2,h=100);
                        }
                    }
            }
        }
        union(){
            m3th_r = 2.8;
            translate([5,0,20])
            rotate([0,-90,0])
            rotate([0,0,45])
            for(i=[0:1]){
                mirror([i,0])
                    for(j=[0:1]){
                        mirror([0,j])
                        {
                            translate([13.5/2,13.5/2,-0.01])
                                cylinder(r=m3th_r/2,h=100);
                        }
                    }
            }
        }
    }  
}
module skrew_extender_2()
{
    difference(){
        intersection(){
            translate([0,0,0])
            rotate([90,0,0])
            linear_extrude(height=40, center=true)
            union(){
                radius=10;
                points_up_round = [
                    for(a = [90:-1:0]) [radius * cos(a), radius * sin(a)+30]
                ];
                points_middle_round = [
                    for(a = [180:1:270]) [radius * cos(a)+20, radius * sin(a)+20]
                ];
                points_bottom_round = [
                    for(a = [0:-1:-90]) [radius * cos(a)+60, radius * sin(a)+radius]
                ];
                polygon(concat([[0, 0]], points_up_round, points_middle_round, points_bottom_round));
            }
            translate([0,0,20])
            rotate([0,90,0])
            cylinder(r1=40/2,r2=88/2,h=200);
        }
        union(){
            m3th_r = 3.3;
            m3bo_r = 8.0;
            translate([53,0,0])
            rotate([0,0,45])
            for(i=[0:1]){
                mirror([i,0])
                    for(j=[0:1]){
                        mirror([0,j])
                        {
                            translate([13.5/2,13.5/2,-0.01])
                                cylinder(r=m3th_r/2,h=100,center=true);
                            translate([13.5/2,13.5/2,-100/2+10-2])
                                cylinder(r=m3bo_r/2,h=100,center=true);
                        }
                    }
            }
        }
        union(){
            m3th_r = 2.8;
            translate([5,0,20])
            rotate([0,-90,0])
            rotate([0,0,45])
            for(i=[0:1]){
                mirror([i,0])
                    for(j=[0:1]){
                        mirror([0,j])
                        {
                            translate([13.5/2,13.5/2,-0.01])
                                cylinder(r=m3th_r/2,h=100);
                        }
                    }
            }
        }
    }  
}
$fn=120;
if(false){
    translate([0,0,-15])
    rotate([0,0,45])
    skrew_mount();
    //rotate([0,0,45+90*i])
    translate([110,0,-50])
    rotate([90,0,0])
    translate([-48,-48,-40])
    import("T100-Thruster-R1-Public.stl");
}
//color([0.5,0.5,0.5,0.8])
//translate([115/2,0,0])
skrew_extender();