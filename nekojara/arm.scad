include <../lib/Getriebe.scad>;

$fn=100;

module arm() {
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
            
            translate([0, 50-5, 0])
            minkowski(){
                cube([0.01,15,15]);
                sphere(r=9.5/2,h=20,center=true);
            }
        }
        translate([0,0, 200/2+5.01/2])
        cube([200,200,200],center=true);
            
        translate([0, 50/2, 0])
        minkowski(){
            cube([0.01,50,50]);
            sphere(r=6.5/2,h=20,center=true);
        }
    }
}
arm();
