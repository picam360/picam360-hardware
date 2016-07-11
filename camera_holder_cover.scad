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
        translate([65/2, 56/2])
        minkowski()
        {
            $fn=100;
            r_rad2=r_rad*2;
            square([20-r_rad*2,35-r_rad*2],center=true);
                circle(r=r_rad);
        }
        //camera hole
        union()
        {
            translate([65/2, 56/2])
                circle(r=13.8/2);
        }
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
                            circle(r=1+(3.2-camera_bolt_r)/2);
                        }
                }
            }
    }
}
module camera_holder_2_2D()
{
    difference(){
        r_rad=1;
        camera_bolt_r=2.3/2;
        translate([65/2, 56/2])
        minkowski()
        {
            $fn=100;
            r_rad2=r_rad*2;
            square([20-r_rad*2,35-r_rad*2],center=true);
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
                            circle(r=1+(3.2-camera_bolt_r)/2);
                        }
                }
            }
    }
}
$fn=360;

translate([0, -56])
camera_holder_1_2D();
//translate([-22, -46, 0])
//camera_holder_1_2D();
//translate([0, -46, 0])
//camera_holder_2_2D();
//translate([22, -46, 0])
//camera_holder_2_2D();