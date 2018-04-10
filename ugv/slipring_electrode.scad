use <../lib/ISOThread.scad>;
$fn=100;

module slipring_electrode(r=24.5, width=9, margin=0)
{
    difference()
    {
        circle(r=r+margin,center=true);
        circle(r=r-width-margin,center=true);
    }
    translate([r,0])
    square([(2.54+1+margin)*2,(2.54+1+margin)*2],center=true);
}

module slipring_electrode_1(r=22.5, width=5)
{
    difference()
    {
        circle(r=r,center=true);
        circle(r=r-width,center=true);
    }
}

slipring_electrode();
//slipring_electrode_1();
