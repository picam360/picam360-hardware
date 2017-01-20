use<camera_hole.scad>

center_y=9.5;

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        translate([r, r])
        square([dimension.x-r*2,dimension.y-r*2]);
        circle(r=r);
    }
}
module camera__pos_2D()
{
    square([8.5+0.5,8.5+0.5], center=true);
}
module camera_unit_1_2D()
{
    difference(){
        r_rad=1;
        margin=1;
        minkowski()
        {
            $fn=100;
            translate([0, (24.0+margin)/2-center_y])
                square([25-r_rad*2,24.0+margin-r_rad*2], center=true);
            circle(r=r_rad);
        }
        //raspi attachemnt holes
        camera_hole_2D();
        translate([0, 13.5/2])
            square([100,margin], center=true);
        for(i=[0,1])
        {
            mirror([i,0])
            translate([21/2, (24.0+0.5-9.5-2)])
                circle(r=2.5/2);
        }
        for(i=[0,1])
        {
            mirror([i,0])
            translate([21/2, -9.5+2])
                circle(r=2.5/2);
        }
    }
}
module camera_unit_2_2D()
{
    r_rad=1; 
    difference(){
        //outer
        minkowski()
        {
            translate([0, 24.0/2-center_y])
            square([25-r_rad*2,24-r_rad*2], center=true);
            circle(r=r_rad);
        }
        //camera connector
        translate([0, 14.5/2])
        minkowski()
        {
            square([16-r_rad*2,7.5-r_rad*2], center=true);
            circle(r=r_rad);
        }
        //camera hole
        for(i=[0,1])
        {
            mirror([i,0])
            translate([18/2, 0])
                circle(r=3.5/2);
        }
        for(i=[0,1])
        {
            mirror([i,0])
            translate([18/2, 0])
                minkowski()
                {
                    square([0.01,1], center=true);
                    circle(r=3.5/2);
                }
        }
        for(i=[0,1])
        {
            mirror([i,0])
            translate([21/2, 24.0-9.5-2])
                circle(r=2.5/2);
        }
        for(i=[0,1])
        {
            mirror([i,0])
            translate([25/2, -9.5])
                minkowski()
                {
                    square([6,6], center=true);
                    circle(r=1);
                }
        }
    }
}
module camera_unit_3_2D()
{
    r_rad=1; 
    difference(){
        //outer
        minkowski()
        {
            translate([0, 24.0/2-center_y])
            square([41-r_rad*2,24-r_rad*2], center=true);
            circle(r=r_rad);
        }
        //camera hole
        for(i=[0,1])
        {
            mirror([i,0])
            translate([18/2, 24-9.5-9.5])
                minkowski()
                {
                    square([0.01,1], center=true);
                    circle(r=3.5/2);
                }
        }
        for(i=[0,1])
        {
            mirror([i,0])
            translate([21/2, (24.0-9.5-2)])
                circle(r=1.74/2);
        }
        translate([0, 24-9.5-9.5])
        minkowski()
        {
            camera_mount_hole_2D();
            circle(r=r_rad);
        }
        translate([0, -5])
        square([25,20], center=true);
        for(i=[0,1])
        {
            mirror([i,0])
            translate([25/2, -2])
            square([8,1], center=true);
        }
        for(k=[0:1])
        {
            r_rad2=0.49;
            translate([0, k*-7.5+17.5])
            minkowski()
            {
                square([1.03-r_rad2*2,7-r_rad2*2], center=true);
                circle(r=r_rad2);
            }
        }
    }
}
module camera_unit_4_2D()
{
    r_rad=1; 
    difference(){
        //outer
        minkowski()
        {
            translate([0, 24.0/2-center_y])
            square([41-r_rad*2,24-r_rad*2], center=true);
            circle(r=r_rad);
        }
        //camera connector
        translate([0, 22/2])
        minkowski()
        {
            square([16-r_rad*2,10-r_rad*2], center=true);
            circle(r=r_rad);
        }
        //camera hole
        for(i=[0,1])
        {
            mirror([i,0])
            translate([21/2, (24.0-9.5-2)])
                circle(r=1.8/2);
        }
        for(i=[0,1])
        {
            mirror([i,0])
            translate([21/2, 0])
                circle(r=1.8/2);
        }
        for(i=[0,1])
        {
            mirror([i,0])
            translate([41/2, 7.5])
            square([8,1], center=true);
        }
    }
}
$fn=360;

//translate([25/2+10, -((24.0+0.5)-center_y)])
//    camera__pos_2D();

module camera_unit_2D()
{
    difference(){
        r_rad=1;
        margin=1;
        union(){
            translate([10.01/2, -50/2])
                square([10.01,50], center=true);
            translate([25/2+10, -((24.0+margin)-center_y)])
                camera_unit_1_2D();
            translate([25/2+10, -(24.0+margin+margin)-(24.0-center_y)])
                camera_unit_2_2D();
            translate([1/2+10+25, -49/2])
                square([1.01,49], center=true);
            translate([41/2+10+25+1, -((24.0+margin)-center_y)])
                camera_unit_3_2D();
            translate([41/2+10+25+1, -(24.0+margin+margin)-(24.0-center_y)])
                camera_unit_4_2D();
            translate([10/2+10+25+1+41, -50/2])
                square([10.01,50], center=true);
        }
        r_rad=0.49;
        space=7;
        for(k=[0:10])
        {
            translate([25/2+10, k*-(space+0.5)-3])
            translate([25/2+1/2, 0])
            minkowski()
            {
                square([1.03-r_rad*2,space-r_rad*2], center=true);
                circle(r=r_rad);
            }
        }
        for(k=[0:10])
        {
            translate([25/2+10, k*-(space+0.5)-3])
            translate([-(25/2+1/2), 0])
            minkowski()
            {
                square([1.03-r_rad*2,space-r_rad*2], center=true);
                circle(r=r_rad);
            }
        }
        for(k=[0:10])
        {
            translate([41/2+10+25+1, k*-(space+0.5)-3])
            translate([41/2+1/2, 0])
            minkowski()
            {
                square([1.03-r_rad*2,space-r_rad*2], center=true);
                circle(r=r_rad);
            }
        }
    }
}
camera_unit_2D();