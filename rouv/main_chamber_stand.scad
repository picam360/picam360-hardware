include<params.scad>

module main_chamber_stand()
{
    r=6;
    h=21+8;
    stand_r=100-2*h;
    space=5;
    thick=0.8;
    difference()
    {
        intersection(){
            union(){
                cylinder(r=(DOME_DIA)/2-3-space, h=h,center=true);
                for(i=[0:7])
                rotate([90,0,i*45])
                translate([0,0,(DOME_DIA)/2-3])
                cylinder(r=8/2, h=40, center=true);
            }
            cylinder(r=(DOME_DIA)/2-3-0.4, h=h,center=true);
        }
        cylinder(r=(DOME_DIA)/2-3-space-thick, h=100,center=true);
        for(i=[0:7])
        rotate([90,0,i*45])
        translate([0,0,(DOME_DIA)/2-3-40/2-2])
        cylinder(r=5/2, h=40, center=true);
        for(i=[0:7])
        rotate([90,0,i*45])
        translate([0,0,(DOME_DIA)/2-3])
        cylinder(r=2.5/2, h=40, center=true);
    }
}
$fn=100;

main_chamber_stand();