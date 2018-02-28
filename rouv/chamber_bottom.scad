include<../params.scad>
use<../lib/bezier.scad>;
use<oring.scad>;

function reverse(array)=[for(i=[0:len(array)-1]) array[len(array)-1-i]];
module chamber_bottom()
{
    difference(){
        thick=3;
        height=20;
        points1 = bezier([
                [50,0],
                [50,height],
                [40,height],
                [20,height],
                [10,height+0.5],
                [0,height+1]
            ], $fn);
        points2 = reverse(bezier([
                [50-thick,0],
                [40,height],
                [10,height-thick-2],
                [8,height-thick],
                [3,height-thick],
                [0,height-thick-0.05]
            ], $fn));
        points = concat(points1, points2);
        //echo(points);
        rotate_extrude()
        polygon(points);
        translate([0,0,100/2+height])
        cube([100,100,100],center=true);
    }
}

$fn=180;
if(false)
{
    difference(){
        chamber_bottom();
        translate([100/2,0,0])
        cube([100,100,100],center=true);
    }
}else{
    chamber_bottom();
}
