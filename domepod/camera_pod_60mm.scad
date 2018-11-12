
module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module camera_pod(dome_dia=50, outer_dia=60, inner_dia=44)
{
    h=15;
    difference(){
        cylinder(r=outer_dia/2, h=h);
        translate([0, 0, h-1])
        cylinder(r=dome_dia/2+0.6, h=10.01);
        cylinder(r=inner_dia/2, h=100, center=true);
        translate([0, 0, 2-100])
        linear_extrude(h=100)
        minkowski_square(dimension=[38+0.5,38+0.5], r=1, $fn=100);
        //camera : outline 38x38, hole 34x34
        camera_bolt_r = 2.1/2;
        for(i=[0:1]){
            mirror([i,0])
                for(j=[0:1]){
                    mirror([0,j])
                        translate([34/2, 34/2])
                            cylinder(r=camera_bolt_r, h=100);
                }
        }
        translate([0, 0, 5-100])
        difference(){
            cylinder(r=outer_dia/2+0.01, h=100);
            cylinder(r=outer_dia/2-2, h=100);
        }
    }
}

$fn=360;
camera_pod();
 