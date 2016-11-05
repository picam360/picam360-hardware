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
module camera_holder()
{
    linear_extrude(height = 2, twist = 0, slices = 0)
    {
        camera_holder_2D();
    }
}
module camera_holder_2D()
{
    difference(){
        r_rad=1;
        minkowski()
        {
            $fn=100;
            r_rad2=r_rad*2;
            translate([r_rad, r_rad])
                square([100-r_rad*2,65-r_rad*2]);
            circle(r=r_rad);
        }
        //raspi attachemnt holes
        translate([100/2, 65/2])
        circle(r=10/2);
        translate([100/2, 0])
        minkowski()
        {
            square([50,30], center=true);
            circle(r=r_rad);
        }
        translate([100/2, 65/2-17])
        circle(r=10/2);
        translate([100/2, 0])
        square([7,65], center=true);
    }
}
$fn=360;

translate([0, -65, 0])
camera_holder_2D();