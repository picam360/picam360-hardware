include<../params.scad>

module spacer()
{
    linear_extrude(height = 5, twist = 0, slices = 0)
    {
        spacer();
    }
}
module spacer_2D(r=2.6)
{
    difference()
    {
        circle(r/2+2);
        circle(r/2+0.2);
    }
}

$fn=360;
for(i=[0:1]){
for(j=[0:1]){
translate([2.6/2+2+j*7,-2.6/2-2-i*7])
    spacer_2D(r=2.6);
}}
