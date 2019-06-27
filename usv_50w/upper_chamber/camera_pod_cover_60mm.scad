use<dome_base_cover.scad>

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module camera_pod_cover(dome_dia=50.8, outer_dia=64, inner_dia=60, tube_thick=2, seal_margin=0.8)
{
    overlap_h=3+6;
    dome_base_cover();
    rotate([180,0,0])
    difference(){
        cylinder(r=outer_dia/2, h=overlap_h);
        cylinder(r=inner_dia/2+seal_margin, h=100, center=true);
    }
}

$fn=120;
camera_pod_cover();
 