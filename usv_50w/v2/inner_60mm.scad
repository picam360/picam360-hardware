
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
    tube_h=140;
    height=tube_h-20*2;
    bolt_r = 1.7/2;
    h=15;//need to be ajust for lens height
    difference(){
        cylinder(r=outer_dia/2-tube_thick-seal_margin, h=2);
        for(i=[0:7]){
            r=34*sqrt(2)/2;
            translate([r*cos((i+0.0)*360/8), r*sin((i+0.0)*360/8), 0])
            {
                translate([0,0,50+1.5])
                cylinder(r=3.5/2, h=height, center=true);
                translate([0,0,-50+15.01])
                cylinder(r=2.1/2, h=height, center=true);
            }
        }
        cylinder(r=15/2, h=height, center=true);

        //tube cable
        for(i=[0:3]){
            rotate(i*90)
            translate([19, 0, -0.01])
            cylinder(r=4.5/2, h=h+.02);
        }
    }
    translate([0, 9, height/2])
    rotate([90,0,0])
    difference()
    {
        union(){
            translate([5,0,0])
            linear_extrude(height=3, center=true)
            square(size=[35,height], center=true);
            
            //raspi
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
        //raspi
        translate([6,0,3/2])
        for(i=[0:1]){
            mirror([i,0])
                for(j=[0:1]){
                    mirror([0,j])
                        translate([30/2-3.5, 65/2-3.5])
                        cylinder(r=bolt_r,h=height,center=true);
                }
        }
    }
    translate([-11, 0, height/2])
    difference(){
        cube(size=[3,20,height], center=true);
        translate([0, 0, -height/2+2+16])
        rotate([90,0,90])
        cylinder(r=8/2,h=height,center=true);
        
    }
//    translate([-19, -1, height/2])
//    rotate([90,0,90])
//        linear_extrude(height=12, center=true)
//        minkowski_square(dimension=[24,height], r=3, $fn=100);
}
$fn=360;
mirror([1,0,0])
pod_inner();
 