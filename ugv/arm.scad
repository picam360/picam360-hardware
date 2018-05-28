include <../lib/Getriebe.scad>;
use <rotor_pitch.scad>;

$fn=100;

module arm() {
           
    difference(){ 
        translate([35, 0, 0])
        rotate([90, 0, 90])
        cylinder(r=16/2,h=8,center=true);
            
        translate([35-2, 0, 0])
        rotate([90, 0, 90])
        cylinder(r=12/2+0.2,h=8,center=true);
    }
    
    difference(){
        offset = 20;
        union(){
            translate([0, offset, 0])
            rotate_extrude(angle=90, convexity=10)
            translate([35, 0])
            circle(r=6/2);
            
            translate([35, offset/2, 0])
            rotate([90, 0, 0])
            cylinder(r=6/2,h=offset,center=true);
            
            translate([0, offset, 0])
            translate([0, 35, 0])
            minkowski(){
                cube([0.01,15,15]);
                sphere(r=9.5/2,h=20,center=true);
            }
        }
        translate([0,0, 200/2+6.01/2])
        cube([200,200,200],center=true);
        
        translate([0, offset, 0])
        translate([0, 50/2, 0])
        minkowski(){
            cube([0.01,50,50]);
            sphere(r=6.5/2,h=20,center=true);
        }
        
        translate([35-2, 0, 0])
        rotate([90, 0, 90])
        cylinder(r=12/2+0.2,h=8,center=true);
    }
}
if(0){
    rotor_pitch();
    arm();
}else{
    arm();
}
