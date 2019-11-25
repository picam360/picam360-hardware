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
        translate([0,0,pod_space_h+thread_h])
        difference(){
            iso_thread(m=outer_dia, p=3, l=thread_h);
            translate([0,0,-0.01])
            cylinder(r=inner_dia/2+margin, h=thread_h+0.02);
        }
        
        translate([0,0,thread_h+pod_space_h-taper2_h])
        difference(){
            cylinder(r2=outer_dia/2-1.5, r1=outer_dia/2, h=taper2_h);
            translate([0,0,-0.01])
            cylinder(r=inner_dia/2+margin, h=taper_h+0.02);
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
            for(angle=[0,90,180,270])
            rotate(angle)
            {
                translate([0,0,thread_h+pod_space_h/2])
                rotate(135)
                rotate([90,0,0])
                translate([0, 0, inner_dia/2-1])
                linear_extrude(height=2)
                mirror([1,0,0])
                text(str(angle), size=5, halign="center", valign="center", font = "Liberation Sans");
            }
        }
        translate([0,0,thread_h])
        difference(){
            cylinder(r2=outer_dia/2,r1=outer_dia/2-1.5, h=taper_h);
            translate([0,0,-0.01])
            cylinder(r=inner_dia/2+margin, h=taper_h+0.02);
        }
        
        difference(){
            iso_thread(m=outer_dia, p=3, l=thread_h);
            translate([0,0,-0.01])
            cylinder(r=(inner_dia)/2+margin, h=thread_h+0.02);
        }
    }
}
module skrew_mount_mask(dome_dia=50.8, outer_dia=108, inner_dia=100, tube_thick=2, margin=0.4)
{
    pod_space_h = 50;
    thread_h = 10;
    taper_h = 2;
    taper2_h = 2;
    m3th_r = 3.1;
    m3bo_r = 7.7;
    
    difference(){
        translate([0,200/2,200/2-0.01])
            cube([200,200,200], center=true);
        translate([0,0,thread_h+(pod_space_h-taper_h-taper2_h)/2+taper2_h])
        rotate([0,-90,0])
        scale([1,0.125,1])
        cylinder(r=(pod_space_h-taper_h-taper2_h)/2, h=150);
    }
    translate([0,0,thread_h+(pod_space_h-taper_h-taper2_h)/2+taper2_h])
    rotate([0,90,0])
    scale([1,0.125,1])
    cylinder(r=(pod_space_h-taper_h-taper2_h)/2, h=150);
}

$fn=120;
if(false)
{
}else{
    intersection(){
        difference(){
            cylinder(r=105/2, h=1);
            translate([0,0,-0.01])
            cylinder(r=100/2+0.5, h=1.2);
        }
        cube([300,5,1], center=true);
    }
    translate([0,1])
    intersection(){
        skrew_mount();
        skrew_mount_mask();
    }
    translate([0,-1])
    difference(){
        skrew_mount();
        skrew_mount_mask();
    }
}