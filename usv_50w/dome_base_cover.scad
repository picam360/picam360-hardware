include<params.scad>

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}
//DOME_DIA + SEAL_MARGIN*2+3
module dome_base_cover(outer_dia=64, dome_base_dia=60, inner_dia=60, tube_thick=2)
{
    h=10;
    overlap_h=10;
    
    difference(){
        intersection(){
            _r = DOME_DIA/2 + SEAL_MARGIN;
            _x = sqrt(_r*_r - overlap_h*overlap_h)+1;
            _h = sqrt(outer_dia*outer_dia/4 - _x*_x);
            translate([0, 0, (h+overlap_h)/2])
            cube([100,100,h+overlap_h],center=true);
            scale([1,1,(h+overlap_h)/_h])
            sphere(r=outer_dia/2);
        }
        translate([0, 0, -0.01])
        cylinder(r1=dome_base_dia/2+SEAL_MARGIN, r2=DOME_DIA/2+SEAL_MARGIN, h=h+0.02);
        translate([0, 0, h])
        sphere(r=DOME_DIA/2+SEAL_MARGIN);
    }
}

$fn=120;
dome_base_cover();
 