include <../lib/Getriebe.scad>;

$fn=100;

module rotor3_2() {
            translate([50-5, -12/2, 0])
            rotate([90, 0, 0])
        scale([1.5,1])
        cylinder(r=3/2-0.2,h=12,center=true);
    
   rotate_extrude(angle=90, convexity=10)
       translate([50-5, 0]) circle(r=5/2);
    translate([0, 50, 0])
            rotate([90, 0, 0])
        cylinder(r=5/2+0.2,h=20,center=true);
}
rotor3_2();
