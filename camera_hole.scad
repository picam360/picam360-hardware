
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
$fn=360;

//translate([0, -56, 0])
camera_hole_2D();