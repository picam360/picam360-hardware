use <../lib/ISOThread.scad>;

$fn=100;
module dome_upper(){
    dome = 32;
    camera = 55;
    difference(){
        intersection(){
            translate([0,0,28/2])
            cylinder(r = camera/2+5, h = 28, center=true);
            translate([0,0,-18])
            sphere(r=50);
        }
        intersection(){
            translate([0,0,25/2])
            cylinder(r = camera/2+1, h = 25, center=true);
            translate([0,0,-18])
            sphere(r=47);
        }
        
        translate([0,0,100/2])
        cylinder(r = (dome+1)/2, h = 100, center=true);
        
        translate([0,0,-10])
        iso_thread(m=camera+6, l=10+10, p=3, t=0.2);
       
        //cube([100,100,100]);
    }

}

dome_upper();