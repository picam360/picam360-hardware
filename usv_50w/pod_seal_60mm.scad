
module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module pod_seal(dome_dia=50.8, outer_dia=60, inner_dia=60, tube_thick=2, seal_margin=0.4)
{
    hole_dia = 8;
    h=5;
    difference(){
        union(){
            translate([0, 0, 1])
            cylinder(r=outer_dia/2, h=h);
            cylinder(r=dome_dia/2, h=1);
        }
        for(i=[0:11])
        {
            
            rotate(i*360/12)
            {
                translate([20, 0, 0])
                cylinder(r=3/2, h=100, center=true);
                translate([20/2, 0, h-3/2+0.01])
                rotate([0, 90, 0])
                {
                    cylinder(r=3/2, h=20,center=true);
                    translate([-3/2, 0, 5])
                    cube([3,3,10],center=true);
                }
            }
        }
        translate([0, 0, h+1-4+0.01])
        cylinder(r=16/2, h=4);
    }
}
$fn=360;
pod_seal();
 