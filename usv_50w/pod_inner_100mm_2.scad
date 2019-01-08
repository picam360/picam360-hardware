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
    thick = 1.5;
    heat_sink_plate_h = 1.5;
    m3th_r = 3.5/2;
    m3_r = 2.7/2;
    bolt_r = 1.7/2;
    battery_h = 18.5*2;
    battery_w = 18.5*6;
    battery_d = 70;
    battery_margin_h = 5;
    inner_h = battery_h;
    inner_w = battery_w+1;
    outer_h = inner_h+thick*2;
    outer_w = inner_w+thick*2;
    outer_d = battery_d+thick*2;
    
    echo(outer_h=outer_h,outer_w=outer_w,outer_d=outer_d);
    //translate([0, 0, 120/2])
    //rotate([90,0,0])
    difference(){
        union(){
            linear_extrude(height=outer_h, center=true)
            intersection(){
                square([outer_d,outer_w],center=true);
                circle(r=135/2);
            }
            translate([0, 10])
            for(i=[0:1]){
                mirror([i,0])
                    for(j=[0:1]){
                        mirror([0,j])
                            translate([30/2-3.5, 65/2-3.5, (inner_h/2+thick+thick/2)])
                                cylinder(r1=4.5,r2=3,h=2,center=true);
                    }
            }
            for(i=[0:1]){
                mirror([i,0])
                    for(j=[0:1]){
                        mirror([0,j])
                            translate([outer_d/2+1/2, 50/2, -outer_h/2+9/2])
                            rotate([90,0,90])
                            cylinder(r1=4.5,r2=3,h=2,center=true);
                    }
            }
        }
        translate([0, 0, -thick/2-0.01])
        cube([68.5+0.5,inner_w,inner_h+thick], center=true);
        translate([0, 10])
        for(i=[0:1]){
            mirror([i,0])
                for(j=[0:1]){
                    mirror([0,j])
                    {
                        translate([30/2-3.5, 65/2-3.5])
                                cylinder(r=bolt_r,h=100);
                    }
                }
        }
        for(i=[0:1]){
            mirror([i,0])
                for(j=[0:1]){
                    mirror([0,j])
                        translate([0, 50/2, -outer_h/2+9/2])
                        rotate([90,0,90])
                        cylinder(r=m3_r,h=100);
                }
        }
    }
//    translate([19, 24/2+inner_h/2+2-2+0.01, -100/2+120])
//    rotate([90,0,90])
//    {
//        linear_extrude(height=3, center=true)
//        minkowski_square(dimension=[24,100], r=2, $fn=100);
//    }
}
$fn=360;
pod_inner();
//pod_inner_100mm();