//include<params.scad>
use<../lib/ISOthread.scad>

module prop_fix(){
    difference(){
        intersection(){
            translate([0,0,-12])
            scale([1,1,2.3])
            sphere(r=20/2);
            cube([20,20,10],center=true);
        }
        translate([0,0,-0.01])
        cylinder(r=4/2+0.6,h=100);
        mirror([0,0,1])
        iso_thread(m=4,l=20,t=0.3);
    }
}
module spinner(){
    difference(){
        intersection(){
            translate([0,0,-12])
            scale([1,1,2.3])
            sphere(r=20/2);
            translate([0,0,-25])
            cube([20,20,20],center=true);
        }
        mirror([0,0,1])
        iso_thread(m=4,l=30,t=0.3);
        translate([0,0,-28])
        rotate([90,0,0])
        cylinder(r=3/2,h=100,center=true);
    }
}
$fn=100;
prop_fix();
//spinner();
//end of code