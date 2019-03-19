
module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module pod_cover(dome_dia=50.8, outer_dia=64, inner_dia=60, tube_thick=2, seal_margin=0.4)
{
    h=20;
    
    
    translate([0, 0, h])
    difference(){
        cylinder(r=outer_dia/2, h=2);
        cylinder(r=10/2, h=100, center=true);
    }
    difference(){
        cylinder(r=outer_dia/2, h=h);
        cylinder(r=inner_dia/2+seal_margin, h=100, center=true);
    }
}

$fn=360;
pod_cover();
 