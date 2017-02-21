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
module camera_unit_1_2D(margin=0)
{
    difference(){
        r_rad=1;        
        minkowski()
        {
            $fn=100;
            translate([0, (24.0+margin)/2-center_y])
                square([25-r_rad*2,24.0+margin-r_rad*2], center=true);
            circle(r=r_rad);
        }
        //raspi attachemnt holes
        camera_hole_2D(margin);
        translate([0, (13+margin)/2])
            square([100,margin], center=true);
        for(i=[0,1])
        {
            mirror([i,0])
            translate([25/2-2, (24.0+margin-center_y-2)])
                circle(r=2.5/2);
        }
        for(i=[0,1])
        {
            mirror([i,0])
            translate([25/2-2, -center_y+2])
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
        translate([0, 16.5/2])
        minkowski()
        {
            square([14-r_rad*2,7.5-r_rad*2], center=true);
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
                    circle(r=4.5/2);
                }
        }
        for(i=[0,1])
        {
            mirror([i,0])
            translate([25/2, -center_y])
                minkowski()
                {
                    square([8-1*2,8-1*2], center=true);
                    circle(r=1);
                }
        }
        for(i=[0,1])
        {
            mirror([i,0])
            translate([25/2, 24-center_y])
                minkowski()
                {
                    square([8-1*2,8-1*2], center=true);
                    circle(r=1);
                }
        }
    }
}

module camera_unit_2D()
{
    difference(){
        r_rad=1;
        con_margin=0;
        margin=1;
        side=0;
        height=24+con_margin;
        union(){
            translate([25/2+side, -((24.0+con_margin)-center_y)])
                camera_unit_1_2D(con_margin);
            translate([-(margin+.01)/2+25+margin+side+0.01, -height/2])
                square([margin+.01,height], center=true);
            
            translate([25+25/2+side+margin, -((24.0+con_margin)-center_y)])
                camera_unit_2_2D();
        }
        r_rad=0.49;
        space=6;
        for(k=[0:10])
        {
            translate([-margin/2+side, k*-(space+0.5)-2])
            minkowski()
            {
                square([1.03-r_rad*2,space-r_rad*2], center=true);
                circle(r=r_rad);
            }
        }
        for(k=[0:10])
        {
            translate([-margin/2+25+margin+side, k*-(space+0.5)-2])
            minkowski()
            {
                square([1.03-r_rad*2,space-r_rad*2], center=true);
                circle(r=r_rad);
            }
        }
        for(k=[0:10])
        {
            translate([-margin/2+25*2+margin*2+side, k*-(space+0.5)-2])
            minkowski()
            {
                square([1.03-r_rad*2,space-r_rad*2], center=true);
                circle(r=r_rad);
            }
        }
        for(k=[0:10])
        {
            translate([-margin/2+25*3+margin*3+side, k*-(space+0.5)-2])
            minkowski()
            {
                square([1.03-r_rad*2,space-r_rad*2], center=true);
                circle(r=r_rad);
            }
        }
    }
}
$fn=360;
camera_unit_2D();