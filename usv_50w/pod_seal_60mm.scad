use<pod_cover_60mm.scad>

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module pod_seal(outer_dia=60, tube_thick=2, seal_margin=0.4)
{
    hole_dia = 18;
    h=2;
    pin=15;
    step=7;
    ary=4;
    difference(){
        union(){
            translate([0, 0, 3-0.01])
            difference(){
                cylinder(r1=outer_dia/2-tube_thick,r2=outer_dia/2-tube_thick-0.4, h=5);
                cylinder(r=34*sqrt(2)/2-3, h=100, center=true);
            }
        }
        camera_bolt_r = 1.7/2;
        for(i=[0:11]){
            r=34*sqrt(2)/2;
            translate([r*cos((i+0.5)*360/12), r*sin((i+0.5)*360/12), 2])
                cylinder(r=camera_bolt_r, h=100);
        }
    }
    pod_cover_60(outer_dia=outer_dia-seal_margin, cable_r=2.5, bent_r=4);
}
$fn=120;
pod_seal();
 