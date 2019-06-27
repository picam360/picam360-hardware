
module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module pod_inner(dome_dia=50.8, outer_dia=60, inner_dia=44, tube_thick=2, seal_margin=0.4)
{
    bolt_r = 1.7/2;
    h=15;//need to be ajust for lens height
    difference(){
        cylinder(r=outer_dia/2-tube_thick-seal_margin, h=2);
        for(i=[-1,0,5,6]){
            r=34*sqrt(2)/2;
            translate([r*cos((i+0.5)*360/12), r*sin((i+0.5)*360/12)])
            {
                translate([0,0,50+1.5])
                cylinder(r=3.5/2, h=100, center=true);
                translate([0,0,-50+15.01])
                cylinder(r=2.1/2, h=100, center=true);
            }
        }
        cylinder(r=10/2, h=100, center=true);
        for(i=[0,1]){
            rotate(90+i*180)
            translate([16, 0, 0])
            cylinder(r=4/2, h=100, center=true);
        }
    }
    translate([0, 12, 100/2])
    rotate([90,0,0])
    difference()
    {
        union(){
            linear_extrude(height=3, center=true)
            minkowski_square(dimension=[45,100], r=3, $fn=100);
            translate([6,0,3/2])
            for(i=[0:1]){
                mirror([i,0])
                    for(j=[0:1]){
                        mirror([0,j])
                            translate([30/2-3.5, 65/2-3.5])
                            cylinder(r1=5,r2=3,h=2);
                    }
            }
        }
        translate([6,0,3/2])
        for(i=[0:1]){
            mirror([i,0])
                for(j=[0:1]){
                    mirror([0,j])
                        translate([30/2-3.5, 65/2-3.5])
                        cylinder(r=bolt_r,h=100,center=true);
                }
        }
    }
    translate([-12, 1, 100/2])
    rotate([90,0,90])
    {
        linear_extrude(height=3, center=true)
        minkowski_square(dimension=[24,100], r=2, $fn=100);
    }
//    translate([-19, -1, 100/2])
//    rotate([90,0,90])
//        linear_extrude(height=12, center=true)
//        minkowski_square(dimension=[24,100], r=3, $fn=100);
}
$fn=360;
mirror([1,0,0])
pod_inner();
 