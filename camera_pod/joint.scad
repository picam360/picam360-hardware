use<cover.scad>
use <../lib/ISOThread.scad>

module joint(target_r=100, male=false)
{
    thread_r = 40;
    thick=1.5;
    if(male){
        difference(){
            union(){
                cylinder(r=target_r/2-2-0.5,h=thick);
                iso_thread(m=thread_r, p=3, l=10+thick);
            }
            cylinder(r=thread_r/2-3,h=100,center=true);
        }
    }else{
        difference(){
            union(){
                cylinder(r=target_r/2-2-0.5,h=thick);
                cylinder(r=thread_r/2+1.5,h=10+thick);
            }
            translate([0,0,-100/2])
            iso_thread(m=thread_r, p=3, l=100, t=0.5, center=true);
            translate([0,0,10+thick+0.01])
            rotate([180,0,0])
            cylinder(r1=thread_r/2,r2=thread_r/2-1.5,h=3);
        }
    }
}

$fn=120;

target_r=100;
male=true;
joint(target_r=target_r, stereo=false,distance=0,male=male);
//if(true){
//    translate([0,0,-(15+1.5)+5])
//    cover(tube_dia=target_r, thread_h=15);
//}