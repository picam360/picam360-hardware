include<../params.scad>
use<oring.scad>;

module chamber_bottom()
{
    margin = 0.5;
    thick = 2;
    ratio = 0.2;
    difference()
    {
        translate([0,0,ORING_DIA/2])
        cylinder(r=DOME_DIA/2+margin,h=ORING_DIA,center=true);
        translate([0,0,ORING_DIA/2])
        oring();
        cylinder(r=DOME_DIA/2-thick,h=100,center=true);
    }
    translate([0,0,ORING_DIA])
    difference()
    {
        union(){
            scale([1,1,ratio])
            sphere(r=DOME_DIA/2+margin);
            cube([3,DOME_DIA+margin*2,(DOME_DIA/2+margin)*ratio*2],center=true);
            cube([DOME_DIA+margin*2,3,(DOME_DIA/2+margin)*ratio*2],center=true);
        }
        scale([1,1,((DOME_DIA/2+margin)*ratio-thick)/(DOME_DIA/2-thick)])
        sphere(r=DOME_DIA/2-thick);
        translate([0,0,-100])
        //translate([0,-50,0])
        cube([200,200,200],center=true);
    }
}

$fn=50;
//projection(cut=true)
chamber_bottom();