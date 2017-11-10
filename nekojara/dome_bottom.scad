use <../lib/ISOThread.scad>;

$fn=100;
module dome_bottom() {
    thread_diameter = 16+2;
    hole_radius=10.5;
    rod_height=2+5+12;
    thread_height=2+10;
    camera = 55;
    difference(){
        union(){
            translate([0,0,rod_height+thread_height])
            iso_thread(m=camera+6, l=10, p=3);
            translate([0,0,-2/2+rod_height+thread_height])
            cylinder(r = 28/2, h = 2, center=true, $fn=6);
            translate([0,0,rod_height/2+thread_height])
            cylinder(r = thread_diameter/2, h = rod_height, center=true);
            translate([0,0,0])
            iso_thread(m=16, l=thread_height);
        }
        translate([0,0,10/2+thread_height+rod_height+3])
        cylinder(r = camera/2, h = 10, center=true);
        
        cylinder(r = hole_radius/2, h = 100, center=true);
    }
    for(i=[0:3])
    {
        r = sqrt(2)*34/2;
        translate([r*cos(i*90),r*sin(i*90),5/2+rod_height+thread_height+3])
        difference(){
            cylinder(r = 8/2, h = 5, center=true);
            cylinder(r = 1.7/2, h = 5, center=true);
        }
    }
}
dome_bottom();