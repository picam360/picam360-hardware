
module oring(outer_dia=100, inner_dia=90)
{
    dia = (outer_dia - inner_dia)/2;
    echo(dia);
    rotate_extrude()
    {
        translate([outer_dia/2-dia/2, 0, 0])
        circle(r=dia/2);
    }
}
$fn=120;
oring();

