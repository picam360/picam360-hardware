use<pod_inner_100mm.scad>;

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
    m3th_r = 3.5/2;
    m3_r = 2.7/2;
    bolt_r = 1.7/2;
    battery_h = 22;
    heat_sink_plate_h = 1.5;
    inner_h = battery_h+heat_sink_plate_h;
    translate([0, 0, 120/2])
    rotate([90,0,0])
    difference(){
        union(){
            translate([0, 0, -2/2+inner_h/2])
                linear_extrude(height=2, center=true)
                intersection(){
                    square([90,120],center=true);
                    circle(r=135/2);
                }
            translate([0, 0, -2/2])
                linear_extrude(height=inner_h+2, center=true)
                intersection(){
                    translate([0, 3/2])
                    square([68.5+0.5+4,120-3],center=true);
                    circle(r=135/2);
                }
            translate([0, 10])
            for(i=[0:1]){
                mirror([i,0])
                    for(j=[0:1]){
                        mirror([0,j])
                            translate([30/2-3.5, 65/2-3.5, -(inner_h/2+2+2/2)])
                                cylinder(r1=3,r2=5,h=2,center=true);
                    }
            }
        }
        translate([0, -10/2, 0])
        cube([68.5+0.5,112.5+0.5+10,inner_h+0.01], center=true);
        for(i=[0:1]){
            mirror([i,0])
                for(j=[0:1]){
                    mirror([0,j])
                    {
                        translate([66.5/2+7, 110/2-20])
                            cylinder(r=m3th_r,h=100,center=true);
                    }
                }
        }
        translate([0, 10])
        for(i=[0:1]){
            mirror([i,0])
                for(j=[0:1]){
                    mirror([0,j])
                    {
                        translate([30/2-3.5, 65/2-3.5])
                                cylinder(r=bolt_r,h=100,center=true);
                    }
                }
        }
    }
    translate([19, 24/2+inner_h/2+2-2+0.01, -100/2+120])
    rotate([90,0,90])
    {
        linear_extrude(height=3, center=true)
        minkowski_square(dimension=[24,100], r=2, $fn=100);
    }
}
$fn=360;
pod_inner();
//pod_inner_100mm();