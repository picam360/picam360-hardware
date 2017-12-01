use <../lib/ISOThread.scad>;

$fn=100;
module nut(m=12)
{
    iso_nut(m=m,t=0.2);
}

nut();