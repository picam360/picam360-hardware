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
                    square([13.2-r_rad*2,13.2-r_rad*2], center=true);
                    circle(r=r_rad);
                }
            translate([65/2, 56/2])
                circle(r=13.8/2);
            translate([65/2, 56/2])
                minkowski()
                {
                    square([4.0-r_rad*2,22.0-r_rad*2], center=true);
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
            square([20-r_rad*2,36-r_rad*2],center=true);
                circle(r=r_rad);
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
            translate([65/2, 56/2])
                minkowski()
                {
                    square([4.0-r_rad*2,22.0-r_rad*2], center=true);
                    circle(r=r_rad);
                }
        }
        translate([65/2, 56/2])
            camera_attachment_hole_2D(neji1=2+1.0, neji2=2.6+1.0);
    }
}
$fn=360;

translate([-22, -46, 0])
camera_holder_1_2D();
translate([-22+21, -46, 0])
camera_holder_2_2D();
translate([-22+21+21, -46, 0])
camera_holder_3_2D();
//for(i=[0:9])
//{
//translate([-22+i*21, -46, 0])
//camera_holder_2_2D();
//}