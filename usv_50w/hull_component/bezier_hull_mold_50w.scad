use <bezier_hull_50w.scad>;
use <../lib/ISOThread.scad>;

module block(angle=20,t=0.5,left=true,right=true,top=true,top=true,bottom=true){
    difference(){
        union(){
            rotate(-angle/2)
            rotate_extrude(angle=angle)
            square([800/2,100]);
            rotate(-angle/2)
            translate([300,0,100/2])
            rotate(-30)
            cylinder(r=30,h=100,$fn=3,center=true);
        }
        rotate(angle/2)
        translate([300,0,100/2])
        rotate(-30)
        cylinder(r=30+t,h=100.2,$fn=3,center=true);
    }
}
module bezier_hull_mold_50w(grid_size=100){
    margin=4/2;
    space=25-margin;
    
    width=ceil(800/grid_size)*grid_size;
    height=ceil(800/grid_size)*grid_size;
    depth=100;
    echo(width=width,height=height,depth=depth);
    difference(){
        translate([0,0,(depth-0.2)/2])
        cylinder(r=800/2,h=depth-0.2,center=true);
        translate([0,0,-0.1])
        bezier_hull_50w();
    }
}

resolution = 100;    
$fn = resolution;

difference(){
    intersection(){
        block();
        bezier_hull_mold_50w();
    }
//    translate([775/2,0,-0.01])
//        iso_thread(m=8, t=0.3, l=100+0.02);
}