include<../params.scad>
use<../lib/bezier.scad>;
use<oring.scad>;

module chamber_bottom()
{
    margin = 0.5;
    thick = 3;
    ratio = 0.4;
    difference()
    {
        union(){
            scale([1,1,ratio])
            sphere(r=DOME_DIA/2);
            intersection(){
                cube([DOME_DIA,DOME_DIA,DOME_DIA*ratio],center=true);
                sphere(r=DOME_DIA/2);
            }
        }
        scale([1,1,(DOME_DIA/2*ratio-thick)/(DOME_DIA/2-thick)])
        sphere(r=DOME_DIA/2-thick);
        translate([0,0,-100])
        cube([200,200,200],center=true);
    }
}

$fn=180;
//projection(cut=true)
//chamber_bottom();

function reverse(array)=[for(i=[0:len(array)-1]) array[len(array)-1-i]];
thick=3;
height=20;
points1 = bezier([
        [50,0],
        [52,height],
        [30,height],
        [20,height],
        [10,height],
        [0,height]
    ], 16);
points2 = reverse(bezier([
        [50-thick,0],
        [40-thick*3,height],
        [30-thick*6,height-thick],
        [20-thick*4,height-thick],
        [10-thick*5,height-thick],
        [0,height-thick]
    ], 16));
        translate([0,0,-100])
color([1,0,0])
circle(r=50);
points = concat(points1, points2);
echo(points);
polygon(points);