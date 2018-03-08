include<params.scad>
use<../tools.scad>
use <../lib/ISOThread.scad>;
use<../lib/arc.scad>

//aisle=0;
//aisle=2.5;//AW24
aisle=2;//motor cable
module fill_jig_simple()
{
    difference()
    {
        cylinder(r1=6.3/2,r2=4.8/2,h=10,center=true);
        cylinder(r1=4.3/2,r2=2.8/2,h=10.01,center=true);
    }
}
module fill_jig(aisle=1)
{
    enter=1.5;
    difference()
    {
        union(){
            translate([0,0,-3/2+20/2])
            cylinder(r1=5/2,r2=4/2,h=3,center=true);
            translate([0,0,-3/2])
            cylinder(r1=7/2,r2=5/2,h=17,center=true);
        }
        
        minkowski(){
            cube([2,0.01,20],center=true);
            sphere(r=enter/2,center=true);
        }
        
        
        translate([0,0,9/2-20/2])
        cylinder(r1=5/2,r2=3/2,h=16.01,center=true);
    
        if(aisle>0)
        {
            rotate([0,0,0])
            translate([10/2,0,20/2+10/2-2-aisle*1.25])
            minkowski(){
                cube([10-aisle,0.01,10-aisle],center=true);
                sphere(r=aisle/2,center=true);
            }
        }
    }
}

$fn=180;
fill_jig(aisle=aisle);