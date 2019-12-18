include<params.scad>
use<oring.scad>

module base_seal(tube_dia=60, tube_thick=2, h=5, is_inner=true)
{
    bent_r=4.5;
    cable_r=4.5;
    step=8;
    ary=4;
    difference()
    {
        cylinder(r=tube_dia/2-tube_thick-0.1, h=h);
        if(tube_dia==60){
            translate([0,0,-0.75])
            oring(outer_dia=56.7+0.3, inner_dia=49.7+0.3);
        }else if(tube_dia==100){
            translate([0,0,-0.75])
            oring(outer_dia=96.0+0.8, inner_dia=84.6+0.8);
        }
        for(i=[0:ary-1])
        {
            for(j=[0:ary-1])
            {
                translate([(j-(ary/2-0.5))*step, (i-(ary/2-0.5))*step, -0.01])
                if(is_inner)
                    cylinder(r1=6/2, r2=cable_r/2, h=h+.02);
                else
                    cylinder(r1=cable_r/2, r2=6/2, h=h+.02);
            }
        }
        camera_bolt_r = 1.7/2;
        for(i=[0:7]){
            r=34*sqrt(2)/2;
            translate([r*cos((i+0.0)*360/8), r*sin((i+0.0)*360/8), 2])
                cylinder(r=camera_bolt_r, h=100);
        }
        for(i=[0:3]){
            rotate(i*90)
            translate([19, 0, -0.01])
            if(is_inner)
                cylinder(r1=6/2, r2=bent_r/2, h=h+.02);
            else
                cylinder(r1=bent_r/2, r2=6/2, h=h+.02);
        }
        for(i=[0:3]){
            rotate(i*90)
            translate([0, tube_dia/2-tube_thick, h])
                sphere(r=1);
        }
        if(tube_dia==100){
            for(i=[0:3])
            {
                for(j=[-1:1])
                {
                    rotate(j*10+90*i)
                    translate([39, 0, -0.01])
                    if(is_inner)
                        cylinder(r1=6/2, r2=cable_r/2, h=h+.02);
                    else
                        cylinder(r1=cable_r/2, r2=6/2, h=h+.02);
                }
            }
        }
    }
}

$fn=120;
tube_dia=60;
is_inner=true;
base_seal(tube_dia=tube_dia, is_inner=is_inner);
//rotate([180,0,0])
//base_seal(tube_dia=tube_dia, is_inner=is_inner);