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
module camera_unit_1_2D()
{
    difference(){
        r_rad=1;
        minkowski()
        {
            $fn=100;
            r_rad2=r_rad*2;
            translate([r_rad, r_rad])
                square([25-r_rad*2,22.5-r_rad*2]);
            circle(r=r_rad);
        }
        //raspi attachemnt holes
        translate([25/2, 22.5/2+2])
        rotate([0,0,180])
        camera_hole_2D();
        translate([100/2, 8.25])
            square([100,0.5], center=true);
    }
}
module camera_unit_2_2D()
{
    r_rad=1; 
    difference(){
        //outer
        translate([0, 2])
        minkowski()
        {
            square([25-r_rad*2,22-r_rad*2], center=true);
            circle(r=r_rad);
        }
        //camera connector
        translate([0, 14.5/2])
        minkowski()
        {
            square([14.5-r_rad*2,7.5-r_rad*2], center=true);
            circle(r=r_rad);
        }
        //camera hole
        for(i=[0,1])
        {
            mirror([i,0])
            translate([18/2, 0])
                circle(r=3.5/2);
        }
    }
}
$fn=360;

//translate([8, -56/2])
translate([0, -56/2+6])
camera_unit_1_2D();
translate([65/2-20, -56/2-8])
camera_unit_2_2D();