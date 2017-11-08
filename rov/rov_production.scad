armpos=105;
//armpos=82.5;
import("../svg/base_plate_assembly_r6.stl");
for(i=[0:3])
    rotate([0,0,45+90*i])
{
    translate([0,92,0])
    rotate([90,0,0])
    cylinder(r=1,h=32,$fn=360);
    
    translate([0,130,0])
    rotate([90,0,0])
    cylinder(r=1,h=13,$fn=360);
    
    translate([0,armpos,-18])
    import("../svg/arm_assembly_r3.stl");
    
    translate([0,armpos,0])
    mirror([i%2,0,0])
    import("../svg/ROVPropAdapter_r1.stl");
}