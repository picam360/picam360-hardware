include<params.scad>
use<skrew_prop.scad>

module skrew(res=100)
{
    $fn = res;
    main_h=10;
    overlap=1.0-0.5;
    
    difference()
    {
        union()
        {
            translate([0,0,(main_h+overlap)/2])
            cylinder(r1=SKREW_OUTER_DIA/2, r2=14.5/2, h=3.3+.01);
            //import("ROVProp.stl");
            difference(){
                skrew_prop(res, nBlade=2, hubRad=SKREW_OUTER_DIA/2,hubHeight=main_h+overlap,shaftRad=SKREW_INNER_DIA/2);
            }
        }
        translate([0,0,(main_h+overlap)/2-0.01])
            cylinder(r1=SKREW_INNER_DIA/2, r2=12.5/2, h=2.5+.01);
        translate([0,0,-0.55])
        cylinder(r=SKREW_INNER_DIA/2, h=10.1, center=true);
        //bolt hole
        for(i=[0,1,2,3])
        {
            translate([9/2*cos(i*90), 9/2*sin(i*90), 0])
                cylinder(r=2/2, h=100, center=true);
        }
        //shaft hole
        cylinder(r=2/2, h=100, center=true);
    }
}

skrew(res=200);