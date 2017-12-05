include <../lib/Getriebe.scad>;

$fn=100;

module rotor3_2() {
    translate([50-5, -10-12/2, 0])
    rotate([90, 0, 0])
    scale([1.5,1])
    cylinder(r=3/2-0.15,h=12,center=true);
    
    difference(){
        union(){
            rotate_extrude(angle=90, convexity=10)
            translate([50-5, 0])
            circle(r=5/2);
            
            translate([50-5, -10/2, 0])
            rotate([90, 0, 0])
            cylinder(r=5/2,h=10,center=true);
            
            translate([0, 52, 0])
            rotate([90, 0, 0])
            cylinder(r=8/2,h=20,center=true);
        }
            
        rotate([90, 0, 0])
        cylinder(r=5/2+0.4,h=1000,center=true);
    }
}
rotor3_2();
