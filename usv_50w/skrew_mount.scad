include<params.scad>

use <../lib/ISOThread.scad>;

module skrew_mount(dome_dia=50.8, outer_dia=108, inner_dia=100, tube_thick=2, margin=0.25)
{
    pod_space_h = 50;
    thread_h = 10;
    taper_h = 2;
    taper2_h = 2;
    m3th_r = 3.1;
    m3bo_r = 7.7;
    
    difference()
    {
        union(){
            translate([0,0,pod_space_h+thread_h])
            difference(){
                iso_thread(m=outer_dia, p=3, l=thread_h);
                translate([0,0,-0.01])
                cylinder(r=inner_dia/2, h=thread_h+0.02);
            }
            
            translate([0,0,thread_h+pod_space_h-taper2_h])
            difference(){
                cylinder(r2=outer_dia/2-1.5, r1=outer_dia/2, h=taper2_h);
                translate([0,0,-0.01])
                cylinder(r=inner_dia/2, h=taper_h+0.02);
            }
            
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
                cylinder(r=inner_dia/2, h=200, center=true);
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
                                    translate([18.5/2,18.5/2])
                                        cylinder(r=m3th_r/2,h=100);
                                    translate([18.5/2,18.5/2])
                                        cylinder(r=m3bo_r/2,h=outer_dia/2);
                                }
                            }
                    }
                }
                for(angle=[0,90,180,270])
                rotate(angle)
                {
                    translate([0,0,thread_h+pod_space_h/2])
                    rotate(135)
                    rotate([90,0,0])
                    translate([0, 0, inner_dia/2-1])
                    linear_extrude(height=2)
                    mirror([1,0,0])
                    text(str(angle), size=6, halign="center", valign="center", font = "Liberation Sans");
                }
            }
            translate([0,0,thread_h])
            difference(){
                cylinder(r2=outer_dia/2,r1=outer_dia/2-1.5, h=taper_h);
                translate([0,0,-0.01])
                cylinder(r=inner_dia/2, h=taper_h+0.02);
            }
            
            difference(){
                iso_thread(m=outer_dia, p=3, l=thread_h);
                translate([0,0,-0.01])
                cylinder(r=(inner_dia)/2, h=thread_h+0.02);
            }
        }
        translate([0,0,200/2+1])
            cube([200,1,200], center=true);
    }
}

$fn=180;
if(false)
{
}else{
    skrew_mount();
}