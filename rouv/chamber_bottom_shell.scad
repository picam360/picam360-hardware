include<params.scad>
use<../lib/bezier.scad>;
use<chamber_bottom.scad>;

function reverse(array)=[for(i=[0:len(array)-1]) array[len(array)-1-i]];
module chamber_bottom_shell()
{
    shell_dia=DOME_DIA;
    shell_thick=SHELL_THICK-SHELL_MARGIN;
    inner_dia=shell_dia-shell_thick*2;
    height=20;
    {
        points1 = bezier([
                [shell_dia*50/100,0],
                [shell_dia*50/100,height],
                [shell_dia*40/100,height],
                [shell_dia*20/100,height],
                [shell_dia*10/100,height],
                [0,height]
            ], $fn);
        points2 = reverse(bezier([
                [inner_dia*50/100,0],
                [inner_dia*50/100,height-shell_thick],
                [inner_dia*40/100,height-shell_thick],
                [inner_dia*20/100,height-shell_thick],
                [inner_dia*10/100,height-shell_thick],
                [0,height-shell_thick]
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
    chamber_bottom_shell();
}
