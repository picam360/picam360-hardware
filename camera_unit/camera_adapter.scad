use<camera_hole.scad>

center_y=9.5;

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}
module camera_adapter_1_2D()
{
    difference(){
        r_rad=1;        
        minkowski()
        {
            $fn=100;
            translate([0, (24.0)/2-center_y])
                square([25-r_rad*2,24.0-r_rad*2], center=true);
            circle(r=r_rad);
        }
        hole_pos=9.5;
        for(i=[0,1])
        {
            mirror([i,0])
            translate([21/2, (24.0-9.5-hole_pos)])
                minkowski_square([1.61,3.2], r=1.6/2);
        }
        hole_pos2=9.5-2;
        for(i=[0,1])
        {
            mirror([i,0])
            translate([21/2, -9.5+hole_pos2])
                minkowski_square([1.61,3.2], r=1.6/2);
        }
    }
}
module camera_adapter_2_2D()
{
    difference(){
        camera_adapter_1_2D();
        translate([0, 9])
        minkowski_square([17,30], r=1.6/2);
        translate([0, 15])
        square([100,20], center=true);
    }
}
module camera_adapter_2D()
{
    difference(){
        r_rad=1;
        con_margin=0;
        margin=1;
        side=0;
        height=24+con_margin;
        union(){
            translate([25/2+side, -((24.0+con_margin)-center_y)])
                camera_adapter_1_2D(con_margin);
            translate([-(margin+.01)/2+25+margin+side+0.01, -(height+10)/2])
                square([margin+.01,height-10], center=true);
            
            translate([25+25/2+side+margin, -((24.0+con_margin)-center_y)])
                camera_adapter_2_2D();
        }
        r_rad=0.49;
        space=6;
        for(k=[0:10])
        {
            translate([-margin/2+25+margin+side, k*-(space+0.5)-2])
            minkowski()
            {
                square([1.03-r_rad*2,space-r_rad*2], center=true);
                circle(r=r_rad);
            }
        }
    }
}
$fn=360;
// translate([25/2, -(24.0-center_y)])
camera_adapter_2D();