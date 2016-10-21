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
                square([65-r_rad*2,56-r_rad*2]);
            circle(r=r_rad);
        }
        //raspi attachemnt holes
        raspi_bolt_r = 2.7/2;
        translate([3.5, 3.5])
        circle(r=raspi_bolt_r);
        translate([61.5, 3.5])
        circle(r=raspi_bolt_r);
        translate([3.5, 52.5])
        circle(r=raspi_bolt_r);
        translate([61.5, 52.5])
        circle(r=raspi_bolt_r);
        translate([65/2, 56/2])
        camera_hole_2D();
        translate([65/2, 0])
        minkowski()
        {
            square([50,11], center=true);
            circle(r=r_rad);
        }
    }
}
$fn=360;

translate([0, -56, 0])
camera_holder_2D();