
module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module camera_pod_cover(dome_dia=50.8, outer_dia=100, inner_dia=100, tube_thick=2, seal_margin=0.4)
{
    difference(){
        cylinder(r=outer_dia/2, h=2);
        cylinder(r=60/2+seal_margin, h=100, center=true);
    }
    difference(){
        translate([0, 0, -5])
        import("pod_cover_60mm.stl");
        translate([0,0,-100/2])
        cylinder(r=100, h=100, center=true);
    }
}

$fn=360;
camera_pod_cover();
 