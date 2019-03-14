include<params.scad>

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module dome_base(dome_base_dia=60, inner_dia=44, tube_thick=2, h=10)
{
    //h need to be ajust for lens height
    difference(){
        cylinder(r1=dome_base_dia/2, r2=DOME_DIA/2, h=h);
        translate([0,0,-1.5])
        cylinder(r=inner_dia/2, h=h);
        cylinder(r=15/2+0.4, h=100, center=true);
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
dome_base();
 