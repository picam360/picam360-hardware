use<camera_pod_100mm.scad>
module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module camera_pod_cover_100mm(dome_dia=50.8, outer_dia=104, inner_dia=100, tube_thick=2, seal_margin=0.4)
{
    difference(){
        union(){
            difference(){
                cylinder(r=outer_dia/2, h=12);
                cylinder(r=60/2+seal_margin, h=100, center=true);
            }
            translate([0, 0, 15-10])
            import("camera_pod_cover_60mm.stl");
        }
        translate([0, 0, -0.01])
        cylinder(r=inner_dia/2+seal_margin, h=10.01);
        //motor cables
        translate([0,0,9-3/2])
        for(i=[0:3])
            rotate([0, 0, i*90])
            for(j=[-1,0,1])
                rotate([90, 0, j*10])
                cylinder(r=3/2, h=100);
    }
}

$fn=360;
camera_pod_cover_100mm();
//camera_pod_100mm();