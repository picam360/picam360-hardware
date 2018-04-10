use <../lib/ISOThread.scad>;
use <slipring.scad>;
$fn=100;

module slipring_filling(r=5/2-0.3, electrode_r=2.5/2+0.1, cable_r=1.7/2, h=10)
{
    difference()
    {
        cylinder(r=r,h=h,center=true);
        translate([0,0,100/2-h/2+1.52])
        cylinder(r=electrode_r,h=100,center=true);
        cylinder(r=cable_r,h=100,center=true);
    }
}
if(false){
    slipring();
    translate([22.5,0,10])
    slipring_filling();
}else{
slipring_filling();
}
