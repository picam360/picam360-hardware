
module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module camera_pod_cover(dome_dia=50.8, outer_dia=64, inner_dia=60, tube_thick=2, seal_margin=0.4)
{
    h=15;
    
    translate([0, 0, h])
    intersection(){
        translate([0, 0, 5/2])
        cube([100,100,5],center=true);
        difference(){
            dia=18;
            scale([outer_dia/dia,outer_dia/dia,1])
            sphere(r=dia/2);
            sphere(r=dome_dia/2+seal_margin);
        }
    }
    difference(){
        cylinder(r=outer_dia/2, h=h);
        cylinder(r=inner_dia/2+seal_margin, h=100, center=true);
    }
}

$fn=360;
camera_pod_cover();
 