include<params.scad>
use <../lib/ISOThread.scad>

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module tube_locker(m=10)
{
    cable_r=4.2;
    difference(){
        union(){
            iso_thread(m=m, l=10+1.5);  
            rotate([0, 0, 90])  
            hex_head(d=iso_hex_size(m),w=5);
        }
        translate([0,0,-0.01])
        cylinder(r=cable_r/2, h=10.02+1.5);
        
        translate([0,0,10])
        rotate([-90, 0, 0])
        cylinder(r=cable_r/2, h=100);
        
        translate([0,0,5.01])
        translate([-cable_r/2,0,0])
            cube([cable_r,100, 100]);
    }
}
module tube_locker_2(m=10)
{
    r=1.5;
    translate([0,0,r])
    rotate_extrude()
    translate([m/2+1.5+0.1,0])
    {
        circle(r=r);
        translate([0,-r/2])
        square([r*2,r],center=true);
    }
}


$fn=120;
m=10;
translate([m*2,0])
tube_locker(m=10);
rotate([0, 0, 90])
iso_nut(m=m,w=5);
//translate([-m*2,0])
translate([0,0,5])
tube_locker_2();