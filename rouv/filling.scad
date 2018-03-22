include<params.scad>
use<../tools.scad>
use <../lib/ISOThread.scad>;
use<../lib/arc.scad>

aisle=0.5;
//aisle=2.5;//AW24
//aisle=2;//motor cable
module filling(aisle=1)
{
    aisle_enter=4;
    aisle_outer=6;
    aisle_len=13.4;
    h1=0;
    h2=aisle_len-6;
    difference()
    {
        cylinder(r1=(aisle_enter+(aisle_outer-aisle_enter)/aisle_len*h2)/2,r2=(aisle_enter+(aisle_outer-aisle_enter)/aisle_len*h1)/2,h=h2-h1);
        
        translate([((aisle_enter+(aisle_outer-aisle_enter)/aisle_len*h1)-aisle)/2,0,0])
        if(aisle>0)
        {
            linear_extrude(height=100.01,center=true)
            minkowski(){
                square([10,0.01]);
                circle(r=aisle/2,center=true);
            }
        }
    }
}

$fn=180;
filling(aisle=aisle);