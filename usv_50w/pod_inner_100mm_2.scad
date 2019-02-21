use<pod_inner_100mm.scad>;

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module pod_inner_100mm_2(dome_dia=50.8, outer_dia=60, inner_dia=44, tube_thick=2, seal_margin=0.4)
{
    thick = 2;
    heat_sink_plate_h = 1.5;
    m3th_r = 3.5/2;
    m3_r = 2.7/2;
    bolt_r = 1.7/2;
    battery_cell_r = 19;
    battery_h = battery_cell_r*2;
    battery_w = battery_cell_r*6;
    battery_d = 70;
    battery_margin_h = 4;//BMS or hold tape
    inner_h = battery_h+battery_margin_h+heat_sink_plate_h;
    inner_w = battery_w;
    inner_d = battery_d;
    outer_h = inner_h+thick;
    outer_w = inner_w;
    outer_d = inner_d+thick*2;
    
    echo(outer_h=outer_h,outer_w=outer_w,outer_d=outer_d);
    translate([0, 0, battery_margin_h])
    {
        difference(){
            union(){
                linear_extrude(height=outer_h, center=true)
                intersection(){
                    square([outer_d,outer_w],center=true);
                    circle(r=135/2);
                }
                translate([0, 40])
                for(i=[0:1]){
                    mirror([i,0])
                        for(j=[0:1]){
                            mirror([0,j])
                                translate([27/2-3.5, 27/2-3.5, (outer_h/2+thick/2)])
                                    cylinder(r1=4.5,r2=3,h=2,center=true);
                        }
                }
                for(i=[0:1]){
                    mirror([i,0])
                        for(j=[0:1]){
                            mirror([0,j])
                                translate([outer_d/2+2/2, 50/2, -outer_h/2+9/2])
                                rotate([90,0,90])
                                cylinder(r1=4.5,r2=3,h=2,center=true);
                        }
                }
            }
            translate([0, 0, -thick/2-0.01])
            cube([inner_d,inner_w+0.02,inner_h], center=true);
            translate([0, 40])
            for(i=[0:1]){
                mirror([i,0])
                    for(j=[0:1]){
                        mirror([0,j])
                        {
                            translate([27/2-3.5, 27/2-3.5])
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
    //    translate([battery_cell_r, 24/2+inner_h/2+2-2+0.01, -100/2+120])
    //    rotate([90,0,90])
    //    {
    //        linear_extrude(height=3, center=true)
    //        minkowski_square(dimension=[24,100], r=2, $fn=100);
    //    }
        translate([0,0,-battery_cell_r/2+outer_h/2-thick])
        difference(){
            translate([0,0,battery_cell_r/2-battery_cell_r/3/2-0.02])
            cube([inner_d+0.02,inner_w,battery_cell_r/3], center=true);
            rotate([90,0,90])
            linear_extrude(height=100, center=true)
            hull() {
                translate([-inner_w/2+battery_cell_r/2,0,0]) circle(r=battery_cell_r/2);
                translate([inner_w/2-battery_cell_r/2,0,0]) circle(r=battery_cell_r/2);
            }
        }
    }
}
$fn=360;
release=true;
if(release){
    pod_inner_100mm_2();
}else{
    translate([0, 0, 115/2+10])
    rotate([-90,0,0])
    pod_inner_100mm_2();
    pod_inner_100mm();
}