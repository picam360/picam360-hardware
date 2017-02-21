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
module camera_adapter_2D()
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
        hole_pos=9.5-2;
        for(i=[0,1])
        {
            mirror([i,0])
            translate([21/2, (24.0-9.5-hole_pos)])
                circle(r=1.6/2);
        }
        for(i=[0,1])
        {
            mirror([i,0])
            translate([21/2, -9.5+hole_pos])
                circle(r=1.6/2);
        }
    }
}
$fn=360;
 translate([25/2, -(24.0-center_y)])
camera_adapter_2D();