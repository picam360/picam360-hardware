
module camera_hole()
{
    linear_extrude(height = 2, twist = 0, slices = 0)
    {
        camera_hole_2D();
    }
}
module camera_attachment_hole_2D(neji1=1.9,neji2=1.9)
{ 
    union(){
        //camera attachemnt holes
        translate([0, 6.0])
            for(i=[0,1])
            {
                mirror([0,i])
                for(j=[0,1])
                {
                    mirror([j,0])
                    translate([21.5/2, 12.5/2])
                        circle(r=neji1/2);
                }
            }
        translate([0, 0])
            for(i=[0,1])
            {
                mirror([0,i])
                for(j=[0,1])
                {
                    mirror([j,0])
                    translate([14/2, 36/2])
                        circle(r=neji2/2);
                }
            }
    }
}
module camera_hole_2D()
{ 
    r_rad=1; 
    //for official camera
    camera_bolt_r=2.3/2;
    union(){
        camera_attachment_hole_2D();
        //camera hole
        union()
        {
            translate([0, 3.5])
            minkowski()
            {
                square([12.5-r_rad*2,18-r_rad*2], center=true);
                circle(r=r_rad);
            }
        }
    }
}
module aruducam_hole_2D()
{     
    //for omni third party camera
    camera2_bolt_r=2.7/2;
    union(){
        translate([0, 0])
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
        translate([28.7/2, 28.7/2 + 5.0])
        minkowski()
        {
            square([4.5-r_rad*2,4.5-r_rad*2], center=true);
            circle(r=r_rad);
        }
    }
}

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
module camera_holder_1_2D()
{
    difference(){
        r_rad=1;
        camera_bolt_r=2.3/2;
        union()
        {
            translate([65/2, 56/2])
                minkowski()
                {
                    square([20-r_rad*2,20-r_rad*2], center=true);
                    circle(r=r_rad);
                }
            translate([65/2, 56/2])
                circle(r=13.8/2);
            translate([65/2, 56/2])
                minkowski()
                {
                    square([8.5-r_rad*2,30.0-r_rad*2], center=true);
                    circle(r=r_rad);
                }
        }
        //camera hole
        union()
        {
            neji=2.4;
            translate([65/2, 56/2])
                circle(r=13.8/2);
            translate([65/2, 56/2+9])
                circle(r=neji/2);
            translate([65/2, 56/2-9])
                circle(r=neji/2);
        }

    }
}
module camera_holder_2_2D()
{
    difference(){
        r_rad=1;
        camera_bolt_r=2.3/2;
        union()
        {
            translate([65/2, 56/2])
                minkowski()
                {
                    square([20-r_rad*2,20-r_rad*2], center=true);
                    circle(r=r_rad);
                }
            translate([65/2, 56/2])
                circle(r=13.8/2);
            translate([65/2, 56/2])
                minkowski()
                {
                    square([8.5-r_rad*2,30.0-r_rad*2], center=true);
                    circle(r=r_rad);
                }
        }
        //camera hole
        union()
        {
            translate([65/2, 56/2])
                minkowski()
                {
                    square([13.4-r_rad*2,13.4-r_rad*2], center=true);
                    circle(r=r_rad);
                }
            translate([65/2, 56/2])
                circle(r=13.8/2);
            translate([65/2, 56/2])
                minkowski()
                {
                    square([4.2-r_rad*2,23.0-r_rad*2], center=true);
                    circle(r=r_rad);
                }
        }
    }
}
module camera_holder_3_2D()
{
    difference(){
        r_rad=1;
        camera_bolt_r=2.3/2;
        translate([65/2, 56/2])
        minkowski()
        {
            $fn=100;
            r_rad2=r_rad*2;
            square([20-r_rad*2,44-r_rad*2],center=true);
                circle(r=r_rad);
        }
        //camera hole
        union()
        {
            translate([65/2, 56/2])
                minkowski()
                {
                    square([13.4-r_rad*2,13.4-r_rad*2], center=true);
                    circle(r=r_rad);
                }
            translate([65/2, 56/2])
                circle(r=13.8/2);
            translate([65/2, 56/2])
                minkowski()
                {
                    square([4.2-r_rad*2,23.0-r_rad*2], center=true);
                    circle(r=r_rad);
                }
        }
        translate([65/2, 56/2])
            camera_attachment_hole_2D(neji1=2+1.0, neji2=2.0+1.0);
        translate([65/2, 56/2])
            for(i=[0,1])
            {
                mirror([0,i])
                for(j=[0,1])
                {
                    mirror([j,0])
                    translate([14/2, 36/2])
                        minkowski()
                        {
                            r_rad=(2.0+1.0)/2;
                            square([0.01,1], center=true);
                            circle(r=r_rad);
                        }
                }
            }
    }
}

thickness=2;
$fn=360;
{
    translate([-32,-28,0])
    union(){
        translate([0,0,2*thickness])
        linear_extrude(height = thickness, twist = 0, slices = 0)
        {
            camera_holder_1_2D();
        }
        translate([0,0,1*thickness])
        linear_extrude(height = thickness, twist = 0, slices = 0)
        {
            camera_holder_2_2D();
        }
        translate([0,0,0*thickness])
        linear_extrude(height = thickness, twist = 0, slices = 0)
        {
            camera_holder_3_2D();
        }
    }
}