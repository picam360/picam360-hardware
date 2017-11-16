
module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        translate([r, r])
        square([dimension.x-r*2,dimension.y-r*2]);
        circle(r=r);
    }
}
module camera_mount_hole_2D(size1=[13.4,13.4],size2=[23.0,4.2])
{ 
    r_rad=1;
    minkowski()
    {
        square([size1.x-r_rad*2,size1.y-r_rad*2], center=true);
        circle(r=r_rad);
    }
    circle(r=13.8/2);
    minkowski()
    {
        square([size2.x-r_rad*2,size2.y-r_rad*2], center=true);
        circle(r=r_rad);
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
                square([65-r_rad*2,56-r_rad*2]);
            circle(r=r_rad);
        }
        //raspi attachemnt holes
        raspi_bolt_r = 2.7/2;
        translate([3.5, 3.5])
        circle(r=raspi_bolt_r);
        translate([61.5, 3.5])
        circle(r=raspi_bolt_r);
        translate([3.5, 52.5])
        circle(r=raspi_bolt_r);
        translate([61.5, 52.5])
        circle(r=raspi_bolt_r);
        
        //pin header
        translate([65/2, 0])
        minkowski()
        {
            square([50,11], center=true);
            circle(r=r_rad);
        }
        
        //38x38
        translate([0, 3, 0]){
            translate([65/2, 56/2])
            camera_mount_hole_2D(size1=[24,38],size2=[38,24]);
            translate([65/2,56/2])
            for(i=[0:1]){
                    mirror([i,0])
                for(j=[0:1]){
                    mirror([0,j])
                    translate([34/2,34/2])
                    circle(raspi_bolt_r);
                }
            }
        }
    }
}
$fn=360;

for(i=[0:0])
{
    translate([0, -56 - 57 * i, 0])
    camera_holder_2D();
 }