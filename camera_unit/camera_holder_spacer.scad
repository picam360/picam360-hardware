use<camera_hole.scad>

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        translate([r, r])
        square([dimension.x-r*2,dimension.y-r*2]);
        circle(r=r);
    }
}
module camera_holder_spacer_2D()
{
    r_rad=1; 
    difference(){
        //outer
        translate([0, 2])
        minkowski()
        {
            square([25-r_rad*2,22-r_rad*2], center=true);
            circle(r=r_rad);
        }
        //camera connector
        translate([0, 14.5/2])
        minkowski()
        {
            square([14.5-r_rad*2,7.5-r_rad*2], center=true);
            circle(r=r_rad);
        }
        //camera hole
        for(i=[0,1])
        {
            mirror([i,0])
            translate([18/2, 0])
                circle(r=3.5/2);
        }
    }
}
$fn=360;

//translate([8, -56/2])
translate([65/2-17, -56/2+13])
camera_holder_spacer_2D();