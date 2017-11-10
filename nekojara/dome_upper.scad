use <../lib/ISOThread.scad>;

$fn=100;
module dome_upper(){
    dome = 45;
    camera = 55;
    difference(){
        translate([0,0,23/2])
        intersection(){
            cylinder(r = camera/2+5, h = 23, center=true);
            translate([0,0,-30])
            sphere(r=50);
        }
        translate([0,0,-100/2+20])
            cylinder(r = dome/2+6.5, h = 100, center=true);
        translate([0,0,10/2+10-0.02])
        intersection(){
            cylinder(r = dome/2+6.5, h = 20, center=true);
            translate([0,0,0])
            sphere(r=dome/2+3);
        }
        translate([0,0,100/2])
        cylinder(r = (dome+1)/2, h = 100, center=true);
        translate([0,0,-10])
        iso_thread(m=camera+6, l=10+10, p=3, t=0.2);
        //cube([100,100,100]);
    }

}

dome_upper();