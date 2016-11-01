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
    width = 65;
    height = 30;
    hole_pos = 3.5;
    difference(){
        r_rad=1;
        minkowski()
        {
            $fn=100;
            r_rad2=r_rad*2;
            translate([r_rad, r_rad])
                square([width-r_rad*2,height+5-r_rad*2]);
            circle(r=r_rad);
        }
        //raspi attachemnt holes
        raspi_bolt_r = 2.7/2;
        translate([hole_pos, hole_pos])
        circle(r=raspi_bolt_r);
        translate([width - hole_pos, hole_pos])
        circle(r=raspi_bolt_r);
        translate([hole_pos, height - hole_pos])
        circle(r=raspi_bolt_r);
        translate([width - hole_pos, height - hole_pos])
        circle(r=raspi_bolt_r);
        translate([65/2, 41.5/2])
        rotate([0,0,-90])
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


for(i=[0:5])
{
    translate([0, -35 - 36 * i, 0])
        camera_holder_2D();
}