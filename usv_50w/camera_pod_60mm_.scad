
module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module dome_base(dome_dia=50.8, dome_thick=3.2, outer_dia=60, inner_dia=44, tube_thick=2, seal_margin=0.4, h=10)
{
    //h need to be ajust for lens height
    difference(){
        union(){
            cylinder(r1=outer_dia/2, r2=dome_dia/2, h=h);
            translate([0,0,h])
            cylinder(r1=dome_dia/2-dome_thick-0.4, r2=dome_dia/2-dome_thick-0.4, h=1);
        }
        translate([0,0,-1])
        cylinder(r=inner_dia/2, h=h);
        cylinder(r=15/2+0.4, h=100, center=true);
    }
}

module camera_pod(dome_dia=50.8, outer_dia=60, inner_dia=44, tube_thick=2, seal_margin=0.4)
{
    h=10;//need to be ajust for lens height
    difference(){
        union()
        {
            dome_base(outer_dia=outer_dia-seal_margin, h=h);
            mirror([0,0,1])
            difference(){
                cylinder(r1=outer_dia/2-tube_thick+0.05, r2=outer_dia/2-tube_thick-0.4, h=5);
                cylinder(r=inner_dia/2, h=100, center=true);
            }
        }
        mirror([0,0,1])
        linear_extrude(h=100)
        minkowski_square(dimension=[38+0.5,38+0.5], r=1, $fn=100);
        //camera : outline 38x38, hole 34x34
        camera_bolt_r = 1.7/2;
        for(i=[0:11]){
            r=34*sqrt(2)/2;
            translate([r*cos((i+0.5)*360/12), r*sin((i+0.5)*360/12), 3])
                mirror([0,0,1])
                cylinder(r=camera_bolt_r, h=100);
        }
    }
}

$fn=120;
camera_pod();
 