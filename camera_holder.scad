
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
                square([56-r_rad*2,65-r_rad*2]);
            circle(r=r_rad);
        }
        //raspi attachemnt holes
        raspi_bolt_r = 2.7/2;
        translate([3.5, 3.5])
        circle(r=raspi_bolt_r);
        translate([3.5, 61.5])
        circle(r=raspi_bolt_r);
        translate([52.5, 3.5])
        circle(r=raspi_bolt_r);
        translate([52.5, 61.5])
        circle(r=raspi_bolt_r);
        //camera attachemnt holes
        translate([56/2, 65/2])
            for(i=[0,1])
            {
                mirror([0,i])
                for(j=[0,1])
                {
                    mirror([j,0])
                    translate([28.7/2, 28.7/2])
                        circle(r=camera_bolt_r);
                }
            }
        //camera hole
        translate([56/2, 65/2])
        minkowski()
        {
            square([13.6-r_rad*2,13.6-r_rad*2], center=true);
            circle(r=r_rad);
        }
        translate([56/2, 65/2])
        minkowski()
        {
            square([4.0-r_rad*2,22.0-r_rad*2], center=true);
            circle(r=r_rad);
        }
        translate([56/2 + 28.7/2, 65/2 + 28.7/2 - 5.0])
        minkowski()
        {
            square([4.5-r_rad*2,4.5-r_rad*2], center=true);
            circle(r=r_rad);
        }
        translate([0, 65/2])
        minkowski()
        {
            square([12,50], center=true);
            circle(r=r_rad);
        }
    }
}
$fn=360;

translate([0, -65, 0])
camera_holder_2D();