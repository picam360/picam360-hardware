use <../lib/ISOThread.scad>;
use <slipring_electrode.scad>;

$fn=100;
module dome_bottom() {
    margin = 0.4;
    thread_diameter = 12;
    hole_radius=6;
    rod_height=4+8+8+12+0.3+0.3;
    thread_height=2+10;
    camera = 55;
    difference(){
        union(){
            translate([0,0,rod_height])
            iso_thread(m=camera+6, l=10, p=3);
            translate([0,0,-4/2+rod_height])
            rotate([0,0,-45])
            cylinder(r = 20/2, h = 4, center=true, $fn=6);
            translate([0,0,rod_height/2])
            cylinder(r = thread_diameter/2, h = rod_height, center=true);
            translate([0,0,-thread_height])
            iso_thread(m=12, l=thread_height);
        }
        translate([0,0,10/2+rod_height+2.5])
        cylinder(r = camera/2, h = 10, center=true);
        
        cylinder(r = hole_radius/2, h = 100, center=true);
        translate([0,0,100/2+12])
        cylinder(r = thread_diameter/2-2, h = 100, center=true);
        translate([0,0,-10/2+12+0.01])
        cylinder(r1 = hole_radius/2, r2 = thread_diameter/2-2, h = 10, center=true);
        
        translate([0,0,100/2+rod_height-4+2])
        rotate([0,0,-45])
        cylinder(r = 16/2, h = 100, center=true, $fn=6);
        
        for(i=[0:1])
        {
            rotate([0,0,45])
            mirror([i,0,0])
            translate([24/2,0,0])
            cylinder(r = hole_radius/2, h = 100, center=true);
        }
        for(i=[0:1])
        {
            mirror([i,0,0])
            translate([100/2+9/2,0,-100/2+1])
            cube([100,2,100], center=true);
        }
        rotate([0,0,-45])
        translate([0,0,rod_height-0.01]){
            translate([17-3/2,0,0])
            cube([2,5,100], center=true);
            slipring_electrode(r=17, attach_margin=0, h=1);
            translate([23+3/2,0,0])
            cube([2,5,100], center=true);
            slipring_electrode(r=23, attach_margin=0, h=1);
        }
    }
    for(i=[0:3])
    {
        r = sqrt(2)*34/2;
        translate([r*cos(i*90),r*sin(i*90),7/2+rod_height+1])
        difference(){
            cylinder(r = 8/2, h = 7, center=true);
            cylinder(r = 1.5/2, h = 7, center=true);
        }
    }
}
dome_bottom();