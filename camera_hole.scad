
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
    //for official camera
    camera_bolt_r=2.3/2;
    union(){
        //camera attachemnt holes
        translate([65/2, 56/2+5.5])
            for(i=[0,1])
            {
                mirror([0,i])
                for(j=[0,1])
                {
                    mirror([j,0])
                    translate([20.85/2, 12.7/2])
                        minkowski()
                        {
                            square([camera_bolt_r*2-1*2,camera_bolt_r*3-1], center=true);
                            circle(r=1);
                        }
                }
            }
        //camera hole
        union()
        {
            translate([65/2, 56/2])
                minkowski()
                {
                    square([13.2-r_rad*2,13.2-r_rad*2], center=true);
                    circle(r=r_rad);
                }
            translate([65/2, 56/2])
                circle(r=13.8/2);
        }
        //camera connector
        translate([65/2 - 1.3, 56/2 + 18.5/2])
        minkowski()
        {
            square([9.3-r_rad*2,8.0-r_rad*2], center=true);
            circle(r=r_rad);
        }
        translate([65/2, 56/2 + 20.0/2])
            square([5.5,5.5], center=true);
        //camera LED
        translate([65/2 + 15/2, 56/2 + 19.8/2])
        minkowski()
        {
            square([3.0-r_rad*2,3.0-r_rad*2], center=true);
            circle(r=r_rad);
        }
    }
    
    //for omni third party camera
    camera2_bolt_r=2.7/2;
    union(){
        translate([65/2, 56/2])
            for(i=[0,1])
            {
                mirror([0,i])
                for(j=[0,1])
                {
                    mirror([j,0])
                    translate([28.7/2, 28.7/2])
                        circle(r=camera2_bolt_r);
                }
            }
        //camera hole
        translate([65/2, 56/2])
        minkowski()
        {
            square([4.0-r_rad*2,22.0-r_rad*2], center=true);
            circle(r=r_rad);
        }
        translate([65/2 - 28.7/2, 56/2 - 28.7/2 + 5.0])
        minkowski()
        {
            square([4.5-r_rad*2,4.5-r_rad*2], center=true);
            circle(r=r_rad);
        }
    }
}
module aruducam_hole_2D()
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