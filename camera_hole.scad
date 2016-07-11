
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
        translate([0, 5.5])
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
            minkowski()
            {
                square([14.5-r_rad*2,14.5-r_rad*2], center=true);
                circle(r=r_rad);
            }
            //circle(r=13.8/2);
        }
        //camera connector
        translate([0, 18.2/2])
        minkowski()
        {
            square([14.5-r_rad*2,10.0-r_rad*2], center=true);
            circle(r=r_rad);
        }
        translate([0, 20.0/2])
            square([5.5,5.5], center=true);
        //camera hole
        translate([0, 0])
        minkowski()
        {
            square([4.0-r_rad*2,22.0-r_rad*2], center=true);
            circle(r=r_rad);
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