
module camera_hole()
{
    linear_extrude(height = 2, twist = 0, slices = 0)
    {
        camera_hole_2D();
    }
}
module camera_mount_hole_2D()
{ 
    r_rad=1;
    minkowski()
    {
        square([13.4-r_rad*2,13.4-r_rad*2], center=true);
        circle(r=r_rad);
    }
    circle(r=13.8/2);
    minkowski()
    {
        square([23.0-r_rad*2,4.2-r_rad*2], center=true);
        circle(r=r_rad);
    }
}
module camera_atachment_hole_2D()
{ 
    for(i=[0,1])
    {
        mirror([i,0])
        translate([21/2, (24.0-9.5-2)])
            circle(r=1.6/2);
    }
    for(i=[0,1])
    {
        mirror([i,0])
        translate([21/2, -9.5+2])
            circle(r=1.6/2);
    }
}
module camera_hole_2D()
{ 
    //for official camera
    camera_bolt_r=2.3/2;
    union(){
        //camera attachemnt holes
        //translate([0, 5.5])
            for(i=[0,1])
            {
                mirror([i,0])
                translate([18/2, 0])
                    minkowski()
                    {
                        square([camera_bolt_r*2-1*2,camera_bolt_r*2-1], center=true);
                        circle(r=1);
                    }
            }
        //camera connector
        translate([0, 12/2+0.25])
        minkowski()
        {
            r_rad=0.5;
            square([8-r_rad*2,3.5-r_rad*2], center=true);
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

translate([0, 0, 0])
    camera_hole_2D();
    //rotate([0,0,180])
    //camera_atachment_hole_2D();