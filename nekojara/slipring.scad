use <../lib/ISOThread.scad>;
$fn=100;

module slipring(attach=false) {
    margin = 0.4;
    inner_thread_diameter = 12+margin;
    gear_act = 2.23995;
    gear_edge = 12-gear_act;
    hole_dia = 3.5;
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
            translate([gear_edge+4/2,0,0])
            rotate([0,90,0])
            cylinder(r=6/2,h=4,center=true);
            translate([gear_edge+4,0,0])
            translate([12.5/2,0,18/2-7])
            minkowski(){
                mr = 1;
                cube([12.5-mr*2,7-mr*2,18-mr*2],center=true);
                sphere(r=mr);
            }
        }
        for(l=[17.5,22.5]){
            translate([l, 0, 0])
            cylinder(r=1.7/2,h=100,center=true);
        
            translate([l, 0, 100/2-5])
            cylinder(r=hole_dia/2+0.4,h=100,center=true);
        }
    }
}

slipring();