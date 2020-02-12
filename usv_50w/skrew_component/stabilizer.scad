//include<params.scad>

use <../../lib/ISOThread.scad>
use <skrew_extender.scad>
use <skrew_stand.scad>

module thruster()
{
    rotate(45)
    translate([-48.4,-50,-40])
    import("T100-Thruster-R1-Public.stl");
                for(angle=[0,90,180,270])
                rotate(angle)
                {
                    rotate([90,0,135])
                    rotate([0,0,45])
                    for(i=[0:1]){
                        mirror([i,0])
                            for(j=[0:1]){
                                mirror([0,j])
                                {
                                    translate([13.5/2,13.5/2])
                                        cylinder(r=3/2,h=100);
                                }
                            }
                    }
                }
}
module stabilizer()
{
    difference(){
        union(){
            translate([0,0,46+3])
            intersection(){
                linear_extrude(h=50, center=true)
                scale([5,1])
                circle(r=8);
                
                rotate([90,0,0])
                cylinder(r=46, h=100, center=true);
            }
            cylinder(r=30/2, h=10);
            translate([0,0,10])
            cylinder(r1=30/2, r2=1, h=20);
        }
        union(){
            m3th_r = 2.7;
            rotate([0,0,45])
            for(i=[0:1]){
                mirror([i,0])
                    for(j=[0:1]){
                        mirror([0,j])
                        {
                            translate([13.5/2,13.5/2,-0.01])
                                cylinder(r=m3th_r/2,h=10);
                        }
                    }
            }
        }
    }
}
$fn=120;
if(false){
    //rotate([0,0,45+90*i])
    translate([-0.3,5,0.3])
    rotate([90+180,0,0])
    translate([-48,-48,-40])
    import("T100-Thruster-R1-Public.stl");
}
if(false){
    translate([-50,0,0])
    rotate([180,0,0])
    skrew_extender();
    translate([0,0,46+50])
    skrew_stand();
}
//color([0.5,0.5,0.5,0.8])
//translate([115/2,0,0])
difference(){
    stabilizer();
    translate([0,100/2,0])
    cube([100,100,200], center=true);
}