use <../lib/ISOThread.scad>

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module hull_center(outer_dia=112, h=100)
{
    bolt_dia=8;
    thread_h=10;
    
    difference(){
        cylinder(r1=outer_dia/2+2, r2=outer_dia/2, h=h);
        iso_thread(m=bolt_dia, t=0.3, l=h);
        for(i=[0,1]){
            translate([0,0,i*h])
            rotate([i*180,0,0])
            translate([0,0,-0.01])
            cylinder(r1=bolt_dia/2+0.5, r2=bolt_dia/2, h=4);
        }
    }
}

$fn=120;
hull_center();