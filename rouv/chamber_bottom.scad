include<params.scad>
use<../lib/bezier.scad>;
use<chamber_bottom_shell.scad>;

function reverse(array)=[for(i=[0:len(array)-1]) array[len(array)-1-i]];
module chamber_bottom()
{
    shell_dia=DOME_DIA;
    inner_dia=shell_dia-SHELL_THICK*2;
    thick=2.5;
    height=20-SHELL_THICK;
    {
        points1 = bezier([
                [inner_dia*50/100,0],
                [inner_dia*50/100,height],
                [inner_dia*40/100,height],
                [inner_dia*20/100,height],
                [inner_dia*10/100,height],
                [0,height]
            ], $fn);
        points2 = reverse(bezier([
                [inner_dia*50/100-thick,0],
                [inner_dia*45/100,height],
                [inner_dia*10/100,height-thick],
                [inner_dia*8/100,height-thick],
                [inner_dia*3/100,height-thick],
                [0,height-thick]
            ], $fn));
        points = concat(points1, points2);
        //echo(points);
        rotate_extrude()
        polygon(points);
    }
}

$fn=180;
if(false)
{
    difference(){
        union(){
        chamber_bottom();
        chamber_bottom_shell();
        }
        translate([100/2,0,0])
        cube([100,100,100],center=true);
    }
}else{
    chamber_bottom();
}
