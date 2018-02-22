include<../params.scad>
use<../lib/bezier.scad>;
use<oring.scad>;

function reverse(array)=[for(i=[0:len(array)-1]) array[len(array)-1-i]];
module chamber_bottom()
{
    thick=3;
    height=20;
    points1 = bezier([
            [50,0],
            [50,height],
            [40,height],
            [20,height],
            [10,height],
            [0,height]
        ], $fn);
    points2 = reverse(bezier([
            [50-thick,0],
            [40,height],
            [10,height-thick],
            [8,height-thick],
            [3,height-thick],
            [0,height-thick]
        ], $fn));
    points = concat(points1, points2);
    echo(points);
    rotate_extrude()
    polygon(points);
}

$fn=180;
//projection(cut=true)
//chamber_bottom();
