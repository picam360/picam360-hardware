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
$fn=360;

//w=107;
//h=42;
//for(i=[0:4])
//{
//    for(j=[0:0])
//    {
//        for(r=[0:1])
//        {
//            translate([54+w*j, -21-h*i, 0])
//            rotate([0,0,180*r])
//            union(){
//                translate([-10, -22, 0])
//                rotate([0,0,90])
//                camera_holder_1_2D();
//                translate([21, -22, 0])
//                rotate([0,0,90])
//                camera_holder_2_2D();
//                translate([-3, -43, 0])
//                rotate([0,0,90])
//                camera_holder_3_2D();
//            }
//        }
//    }
//}
h=42;
for(i=[0:4])
{
    translate([54, -21-h*i, 0])
    union(){
        translate([-10, -22, 0])
        rotate([0,0,90])
        camera_holder_1_2D();
        translate([-10, -43, 0])
        rotate([0,0,90])
        camera_holder_1_2D();
    }
}
    