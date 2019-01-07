
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
    hole_dia = 18;
    h=5;
    pin=15;
    difference(){
        union(){
            translate([0, 0, 1])
            cylinder(r=outer_dia/2, h=h);
            cylinder(r=dome_dia/2, h=1);
        }
        for(i=[0:pin-1])
        {
            
            rotate(i*360/pin)
            {
                translate([hole_dia+4, 0, 0])
                cylinder(r=3/2, h=100, center=true);
                translate([(hole_dia+4)/2, 0, h-3/2+0.01])
                rotate([0, 90, 0])
                {
                    cylinder(r=3/2, h=20,center=true);
                    translate([-3/2, 0, (hole_dia+4)/4])
                    cube([3,3,(hole_dia+4)/2],center=true);
                }
            }
        }
        translate([0, 0, h+1-4+0.01])
        cylinder(r=hole_dia/2, h=4);
    }
}
$fn=360;
pod_seal();
 