use <../lib/ISOThread.scad>;

$fn=100;
module dome_upper(){
    margin = 0.5;
    dome = 32 + margin;
    camera = 55;
    height = 28;
    height1 = 18;
    difference(){
        union(){
            translate([0,0,height1/2])
            cylinder(r = camera/2+4, h = height1, center=true);
            translate([0,0,height1+(height-height1)/2])
            cylinder(r1 = camera/2+4, r2 = camera/2-8,h = height-height1, center=true);
        }
        union(){
            translate([0,0,height1/2])
            cylinder(r = camera/2+2, h = height1+0.01, center=true);
            translate([0,0,height1+(height-height1-2)/2+0.01])
            cylinder(r1 = camera/2+2, r2 = camera/2-10,h = height-height1-2+0.02, center=true);
        }
        
        translate([0,0,100/2])
        cylinder(r = dome/2, h = 100, center=true);
        
        translate([0,0,-10])
        iso_thread(m=camera+6, l=10+10, p=3, t=0.2);
       
        //cube([100,100,100]);
    }

}

dome_upper();