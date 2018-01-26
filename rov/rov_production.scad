armpos=120;
//armpos=82.5;
import("../svg/base_plate_assembly_r6.stl");
for(i=[0:3])
    rotate([0,0,45+90*i])
{
    translate([0,92,0])
    rotate([90,0,0])
    cylinder(r=1,h=32,$fn=360);
    
    rotate([0,0,45])
    translate([0,78,3])
    rotate([90,0,0])
    cylinder(r=1,h=14,$fn=360);
    
    translate([0,armpos,-18])
    rotate([0,0,-45+(i%2)*90])
    mirror([i%2,0,0])
    import("arm_assemble.stl");
    
    rotate([0,0,45])
    translate([0,90,0])
    mirror([i%2,0,0])
    import("ROVPropAdapter.stl");
}