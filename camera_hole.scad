
module camera_hole()
{
    linear_extrude(height = 2, twist = 0, slices = 0)
    {
        camera_hole_2D();
    }
}
module camera_hole_2D()
{ 
    r_rad=1; 
    //camera attachemnt holes
    translate([65/2, 56/2])
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
    translate([65/2, 56/2])
    minkowski()
    {
        square([13.6-r_rad*2,13.6-r_rad*2], center=true);
        circle(r=r_rad);
    }
    translate([65/2, 56/2])
    minkowski()
    {
        square([22.0-r_rad*2,4.0-r_rad*2], center=true);
        circle(r=r_rad);
    }
    //camera LED
    translate([65/2 + 28.7/2 - 5.0, 56/2 + 28.7/2])
    minkowski()
    {
        square([4.5-r_rad*2,4.5-r_rad*2], center=true);
        circle(r=r_rad);
    }
}
$fn=360;

//translate([0, -56, 0])
camera_hole_2D();