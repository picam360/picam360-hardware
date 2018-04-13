use <../lib/ISOThread.scad>;
$fn=100;

module slipring(attach=false, r=22) {
    margin = 0.4;
    inner_thread_diameter = 12+margin;
    gear_act = 2.23995;
    gear_edge = 12-gear_act;
    hole_dia = 2.5+0.5;
    if(attach){
        difference() {
            union() {
                translate([gear_edge/2, 0, 0])
                rotate([0, 90, 0])
                cylinder(r2=6/2,r1=5/2,h=gear_edge,center=true);
            }
            cylinder(r=inner_thread_diameter/2,h=100,center=true);
        }
    }
    difference() {
        union(){
            translate([gear_edge+6/2,0,0])
            rotate([0,90,0])
            cylinder(r=6/2,h=6,center=true);
            translate([gear_edge+4.7,0,0])
            translate([10.5/2,0,18/2-6.5])
            minkowski(){
                mr = 2.5;
                cube([10.5-mr*2,8-mr*2,18-mr*2],center=true);
                sphere(r=mr);
            }
        }
        {
            translate([r, 0, 0])
            minkowski(){
                cube([10,0.01,0.01]);
                cylinder(r=1.6/2,h=100,center=true);
            }
        
            translate([r, 0, 100/2-5])
            cylinder(r=hole_dia/2,h=100,center=true);
        }
    }
}

slipring();