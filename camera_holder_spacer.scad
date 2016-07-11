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
        union(){
            //camera hole
            union()
            {
                minkowski()
                {
                    square([14.5-r_rad*2,14.5-r_rad*2], center=true);
                    circle(r=r_rad);
                }
                //circle(r=13.8/2);
            }
            //camera connector
            translate([0, 18.2/2])
            minkowski()
            {
                square([14.5-r_rad*2,10.0-r_rad*2], center=true);
                circle(r=r_rad);
            }
            translate([0, 20.0/2])
                square([5.5,5.5], center=true);
            //camera hole
            translate([0, 0])
            minkowski()
            {
                square([4.0-r_rad*2,22.0-r_rad*2], center=true);
                circle(r=r_rad);
            }
        }
        translate([0, 3.5])
        minkowski()
        {
            square([12.5-r_rad*2,19-r_rad*2], center=true);
            circle(r=r_rad);
        }
    }
}
$fn=360;

//translate([8, -56/2])
translate([65/2, -56/2])
camera_holder_spacer_2D();