use<pod_inner_100mm.scad>;
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
    thick=3;
    m3_r = 2.8/2;
    m3t_r = 3.2/2;
    bolt_r = 1.7/2;
    h=15;//need to be ajust for lens height
    battery_cell_r = 19;
    battery_box_w = 73+2*2;
    outer_w = battery_box_w+3*2;
    esc_h=10;
    outer_h = 116+esc_h;
    heat_sink_plate_h = 1.5;
    difference(){
        linear_extrude(height=thick)
        {
            circle(r=outer_dia/2-tube_thick-seal_margin);
            //circle(r=96/2);
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
        cylinder(r=10/2, h=100, center=true);
    }
    
    translate([0, -battery_cell_r-heat_sink_plate_h-thick/2, outer_h/2])
    rotate([90,0,0])
    difference()
    {
        union(){
            linear_extrude(height=thick, center=true)
                minkowski_square(dimension=[outer_w,outer_h], r=20, $fn=100);
            translate([0,esc_h/2,1.5])
            for(i=[0:1]){
                mirror([i,0])
                    for(j=[0:1]){
                        mirror([0,j])
                        {
                            translate([68.5/2-9, 112.5/2-3])
                                cylinder(r1=4.5,r2=3,h=2);
                            translate([65.5/2-5, 100/2-4.5])
                                cylinder(r1=4.5,r2=3,h=2);
                            translate([(battery_box_w)/2, 50/2])
                            rotate([90,0,90])
                            difference(){
                                cylinder(r=25/2,h=3);
                                translate([-100/2,0,-0.01])
                                cube([100,100,3.02]);
                                translate([0,-3-9/2-0.3])
                                cylinder(r=m3t_r,h=100,center=true);
                            }
                        }
                    }
            }
        }
        translate([0,-outer_h/2+thick,0])
        cylinder(r=16/2, h=100, center=true);
        translate([0,esc_h/2,0])
        linear_extrude(height=100, center=true)
        intersection(){
            minkowski_square(dimension=[65.5-10,100], r=3, $fn=100);
            circle(r=90/2);
        }
        translate([0,esc_h/2,0])
        for(i=[0:1]){
            mirror([i,0])
                for(j=[0:1]){
                    mirror([0,j])
                    {
                        translate([68.5/2-9, 112.5/2-3])
                            cylinder(r=m3_r,h=100,center=true);
                        translate([65.5/2-5, 100/2-4.5])
                            cylinder(r=m3_r,h=100,center=true);
                    }
                }
        }
    }
}
$fn=360;
pod_inner_100mm();
if(false){
    color(GREEN)
    translate([0,-26.5,68])
    rotate([90,0,0])
    linear_extrude(height=2, center=true)
    minkowski_square(dimension=[65.5,100], r=3, $fn=100);
}
 