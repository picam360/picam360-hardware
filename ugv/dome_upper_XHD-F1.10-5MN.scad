use <../lib/ISOThread.scad>;

$fn=100;
module dome_upper(){
    margin = 2.0;
    dome = 27 + margin;
    camera = 55;
    outer_r1 = camera/2+4;
    outer_r2 = dome/2+4;
    height = 10+15;
    height1 = height-(outer_r1-outer_r2)/tan(180-250/2);
    difference(){
        union(){
            translate([0,0,height1/2])
            cylinder(r = outer_r1, h = height1, center=true);
            translate([0,0,height1+(height-height1)/2])
            cylinder(r1 = outer_r1, r2 = outer_r2,h = height-height1, center=true);
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