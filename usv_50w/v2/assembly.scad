use<../../camera_pod/assembly.scad>

module sw_pod_100mm(){
    translate([0,0,11.5+3.5])
    import("inner_100mm.stl");
    pod(tube_dia=100,h=160,margin=3.7);
}
module sw_pod_60mm(){
    translate([0,0,11.5+3.5+10])
    import("inner_60mm.stl");
    pod(tube_dia=60,h=160,margin=3.7);
}

translate([0,0,160+100+2+60+5])
pod(tube_dia=60,h=40,camera=true,margin=1);

translate([0,0,100+2+60])
sw_pod_60mm();

translate([0,0,100+2])
import("adapter_60mm.stl");
translate([0,0,100+2+60])
import("adapter_60mm_holder.stl");

translate([0,0,100-10])
import("../hull_component/hull_base.stl");
color([1.0,1.0,0.5])
import("../hull_component/bezier_hull_50w.stl");

translate([0,0,100-10])
import("adapter_100mm.stl");

translate([0,0,100-12])
import("adapter_joint.stl");

translate([0,0,-60-2-2-13])
sw_pod_100mm();

translate([0,0,10])
union(){
    translate([0,0,-60-2-2-10+70])
    import("../skrew_component/skrew_mount_cover.stl");
    translate([0,0,-60-2-2-10+10])
    import("../skrew_component/skrew_mount.stl");
    translate([0,0,-60-2-2-10+20])
    rotate([180,0,0])
    import("../skrew_component/skrew_mount_cover.stl");
}
    
translate([0,0,-60-2-2-17.5])
rotate([180,0,0])
import("../../camera_pod/joint_single.stl");

translate([0,0,-60-2-2-17.5])
rotate([180,0,0])
pod(tube_dia=60,h=40,camera=true,margin=1);

translate([0,0,10])
for(i=[0,1,2,3]){
    rotate([0,0,45+90*i])
    union(){
        translate([110,0,-50-20])
        rotate([90,0,0])
        translate([-48,-48,-40])
        import("../skrew_component/T100-Thruster-R1-Public.STL");
        translate([112/2,0,-10])
        rotate([180,0,0])
        import("../skrew_component/skrew_extender_2.stl");
        translate([110,0,-50-66])
        rotate([180,0,0])
        import("../skrew_component/skrew_stand.stl");
    }
}