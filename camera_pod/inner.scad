include<params.scad>

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}
module  minkowski_square_3d(dimension, r=2)
{
    minkowski()
    {
        cube([dimension.x-r*2,dimension.y-r*2, 0.01], center=true);
        sphere(r=r);
    }
}

module camera_pod_60mm(outer_dia=60, tube_thick=2)
{
    bolt_r=1.7/2;
    bolt_via_r=2.1/2;
    head_via_r=3.8/2;
    lens_h=2;
    h=15;//need to be ajust for lens height
    difference(){
        cylinder(r=outer_dia/2-tube_thick-0.1, h=h);
        cylinder(r=42/2, h=100, center=true);
        mirror([0,0,1])
        linear_extrude(height=100, center=true)
        minkowski_square(dimension=[38+0.5,38+0.5], r=1, $fn=100);
        
        for(i=[0:3]){
            r=34*sqrt(2)/2;
            translate([r*cos(i*360/4), r*sin(i*360/4), 0])
            mirror([0,0,1])
            cylinder(r=bolt_via_r, h=100,center=true);
        }
        for(i=[0:3]){
            r=34*sqrt(2)/2;
            translate([r*cos(i*360/4), r*sin(i*360/4), 2])
            cylinder(r=head_via_r, h=100);
        }
    }
    for(i=[0:3]){
        r=34*sqrt(2)/2;
        translate([r*cos((i+0.5)*360/4), r*sin((i+0.5)*360/4), 0])
        difference(){
            linear_extrude(height=lens_h)
            minkowski_square(dimension=[5,5], r=0.5, $fn=100);
            cylinder(r=bolt_via_r, h=100,center=true);
        }
    }
}
$fn=120;
camera_pod_60mm();
 