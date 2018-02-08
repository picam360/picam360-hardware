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
        translate([gear_edge,0,0])
        translate([18/2,0,18/2-7])
        minkowski(){
            mr = 1;
            cube([18-mr*2,10-mr*2,18-mr*2],center=true);
            sphere(r=mr);
        }
        translate([17, 0, 0])
        cylinder(r=3/2,h=100,center=true);
        translate([23, 0, 0])
        cylinder(r=3/2,h=100,center=true);
    
        translate([17, 0, 100/2-5])
        cylinder(r=hole_dia/2+0.2,h=100,center=true);
        translate([23, 0, 100/2-5])
        cylinder(r=hole_dia/2+0.2,h=100,center=true);
    }
}

slipring();