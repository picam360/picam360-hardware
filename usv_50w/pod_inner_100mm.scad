
module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module pod_inner_100mm(dome_dia=50.8, outer_dia=60, inner_dia=44, tube_thick=2, seal_margin=0.4)
{
    m3_r = 2.8/2;
    bolt_r = 1.7/2;
    h=15;//need to be ajust for lens height
    difference(){
        linear_extrude(height=3)
        {
            circle(r=outer_dia/2-tube_thick-seal_margin);
        }
        for(i=[0,5,6,11]){
            r=34*sqrt(2)/2;
            translate([r*cos((i+0.5)*360/12), r*sin((i+0.5)*360/12)])
            {
                translate([0,0,50+1.5])
                cylinder(r=3.5/2, h=100, center=true);
                translate([0,0,-50+15.01])
                cylinder(r=2.1/2, h=100, center=true);
            }
        }
        translate([0,14,0])
        cylinder(r=6/2, h=100, center=true);
    }
    
    translate([0, -22/2-3/2-1.5, 120/2])
    rotate([90,0,0])
    difference()
    {
        union(){
            linear_extrude(height=3, center=true)
            intersection(){
                minkowski_square(dimension=[90,120], r=3, $fn=100);
                circle(r=135/2);
            }
            translate([0,0,1.5])
            for(i=[0:1]){
                mirror([i,0])
                    for(j=[0:1]){
                        mirror([0,j])
                        {
                            translate([68.5/2-9, 112.5/2-3])
                                cylinder(r1=4.5,r2=3,h=2);
                            translate([66.5/2+7, 110/2-20])
                                cylinder(r1=4.5,r2=3,h=2);
                        }
                    }
            }
            translate([5,0,1.5])
            for(i=[0:1]){
                mirror([i,0])
                    for(j=[0:1]){
                        mirror([0,j])
                        {
                            translate([65.5/2-5, 100/2-4.5])
                                cylinder(r1=4.5,r2=3,h=2);
                        }
                    }
            }
        }
        translate([5,0,0])
        linear_extrude(height=100, center=true)
        intersection(){
            minkowski_square(dimension=[65.5-8,100], r=3, $fn=100);
            circle(r=90/2);
        }
        for(i=[0:1]){
            mirror([i,0])
                for(j=[0:1]){
                    mirror([0,j])
                    {
                        translate([68.5/2-9, 112.5/2-3])
                            cylinder(r=m3_r,h=100,center=true);
                        translate([66.5/2+7, 110/2-20])
                            cylinder(r=m3_r,h=100,center=true);
                    }
                }
        }
        translate([5,0,0])
        for(i=[0:1]){
            mirror([i,0])
                for(j=[0:1]){
                    mirror([0,j])
                    {
                        translate([65.5/2-5, 100/2-4.5])
                            cylinder(r=m3_r,h=100,center=true);
                    }
                }
        }
    }
}
$fn=360;
pod_inner_100mm();
 