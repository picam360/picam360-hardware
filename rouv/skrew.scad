use<skrew_prop.scad>

module skrew(res=100)
{
    $fn = res;
    inner_r = 23.3;
    outer_r = 26.5;
    
    difference()
    {
        union()
        {
            translate([0,0,9/2+4.2-.01])
            cylinder(r1=outer_r/2, r2=14.5/2, h=3.3+.01);
            translate([0,0,3])
            //import("ROVProp.stl");
            difference(){
                skrew_prop(res, nBlade=2, hubRad=outer_r/2);
                translate([0,0,100/2+5.7])
                cube([100,100,100], center=true);
                translate([0,0,-100/2-5.5])
                cube([100,100,100], center=true);
            }
        }
        translate([0,0,9/2+3-.01])
            cylinder(r1=inner_r/2, r2=12.5/2, h=2.5+.01);
        translate([0,0,3-0.55])
        cylinder(r=inner_r/2, h=10.1, center=true);
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