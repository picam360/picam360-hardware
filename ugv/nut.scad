use <../lib/ISOThread.scad>;

$fn=100;
module nut(m=12)
{
    intersection(){
        iso_nut(m=m,t=0.2);
        cylinder(r=20/2,h=20,center=true);
    }
}

nut();