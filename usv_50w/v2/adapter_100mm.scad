use<../../lib/ISOThread.scad>
//use<../upper_chamber/cable_pod_60mm.scad>
use<cable_stud.scad>
use<../../camera_pod/cover.scad>

module cable_pod_100mm(dome_dia=50.8, margin=0.25)
{
    thread_h = 10;
    thread_dia = 74;
    thick = 2;
    key_r=10;
    cable_r=7;
    
    difference(){
        union(){
            cylinder(r=107/2, h=thread_h);
            //key
            translate([0,0,key_r/2])
            rotate([90, 0, 0])
            cylinder(r=key_r/2, h=112, center=true);
        }
        translate([0,0,-0.01])
        iso_thread(m=thread_dia, p=3, t=0.5, l=thread_h+0.02);
        translate([0,0,thread_h+0.01])
        rotate([180, 0, 0])
        cylinder(r1=thread_dia/2+0.3, r2=thread_dia/2-2, h=4);
        //cable
        translate([0,0,key_r-cable_r/2])
        for(i=[0:3])
            rotate([0, 0, i*90+45])
                rotate([90, 0, 0])
                    linear_extrude(height=100)
                    hull(){
                        circle(r=cable_r/2);
                        translate([0,10])
                        circle(r=cable_r/2);
                    }
        translate([0,0,-0.01])
        for(i=[0:3])
            rotate([0, 0, i*90+45])
                rotate([0, 0, 0])
                    linear_extrude(height=10)
                    hull(){
                        circle(r=cable_r/2);
                        translate([0,38.5])
                        circle(r=cable_r/2);
                    }
    }
}

$fn=120;
cable_pod_100mm();

if(false){
    translate([0,0,30])
    cable_pod_60mm();
    translate([0,0,20])
    cable_stud();
}
//if(true){
//    translate([0,0,-(15+1.5)])
//    cover(tube_dia=100, thread_h=15);
//}