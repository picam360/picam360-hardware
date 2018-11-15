
module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module camera_pod(dome_dia=50.8, outer_dia=60, inner_dia=44, tube_thick=2, seal_margin=0.4)
{
    h=15;//need to be ajust for lens height
    difference(){
        cylinder(r=outer_dia/2, h=h);
        translate([0, 0, h-1])
        cylinder(r=dome_dia/2+seal_margin, h=10.01);
        cylinder(r=inner_dia/2, h=100, center=true);
        translate([0, 0, h-10-100])
        linear_extrude(h=100)
        minkowski_square(dimension=[38+0.5,38+0.5], r=1, $fn=100);
        //camera : outline 38x38, hole 34x34
        camera_bolt_r = 1.7/2;
        for(i=[0:11]){
            r=34*sqrt(2)/2;
            translate([r*cos((i+0.5)*360/12), r*sin((i+0.5)*360/12)])
                cylinder(r=camera_bolt_r, h=100, center=true);
        }
        translate([0, 0, 5-100])
        difference(){
            cylinder(r=outer_dia/2+0.01, h=100);
            cylinder(r=outer_dia/2-tube_thick-seal_margin, h=100);
        }
    }
}

$fn=360;
camera_pod();
 