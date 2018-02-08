
module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}
module camera_mount_hole_2D(size1,size2)
{ 
    minkowski_square(dimension=size1, r=1, $fn=100);
    minkowski_square(dimension=size2, r=1, $fn=100);
}
module camera_holder()
{
    linear_extrude(height = 2, twist = 0, slices = 0)
        camera_holder_2D();
}
module camera_holder_2D()
{
    difference(){
        //outline of raspi dimention
        translate([65/2, 56/2])
        minkowski_square(dimension=[65,56], r=2, $fn=100);
        
        //camera : outline 38x38, hole 34x34
        camera_bolt_r = 2.7/2;
        translate([0, 3, 0]){
            translate([65/2, 56/2])
                camera_mount_hole_2D(size1=[24,38], size2=[38,24]);
            translate([65/2,56/2])
                for(i=[0:1]){
                    mirror([i,0])
                        for(j=[0:1]){
                            mirror([0,j])
                                translate([34/2, 34/2])
                                    circle(camera_bolt_r);
                        }
                }
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
            minkowski_square(dimension=[52,13], r=1, $fn=100);    
    }
}
$fn=360;

for(i=[0:0])
{
    translate([0, -56 - 57 * i, 0])
    camera_holder_2D();
 }
 