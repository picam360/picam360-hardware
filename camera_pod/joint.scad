use<cover.scad>
use <../lib/ISOThread.scad>

module joint(target_r=100, male=false, cable_dia=0)
{
    thread_h = 8;
    thread_r = 40;
    thick=1.5;
    if(male){
        difference(){
            union(){
                cylinder(r=target_r/2-2-0.5,h=thick);
                translate([0,0,thick])
                cylinder(r=thread_r/2+1.5,h=thread_h);
                translate([0,0,thick+thread_h])
                iso_thread(m=thread_r, p=3, l=thread_h+thick);
            }
            cylinder(r=thread_r/2-3,h=100,center=true);
            if(cable_dia > 0){
                //cable
                translate([0,0,-cable_dia/2+thick+thread_h])
                for(i=[0])
                    rotate([0, 0, i*90])
                        rotate([90, 0, 0])
                            linear_extrude(height=100)
                            hull(){
                                circle(r=cable_dia/2);
                                translate([0,100])
                                circle(r=cable_dia/2);
                            }
                }
        }
    }else{
        difference(){
            union(){
                cylinder(r=target_r/2-2-0.5,h=thick);
                translate([0,0,thick])
                cylinder(r=thread_r/2+1.5,h=thread_h);
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

target_r=60;
male=false;
cable_dia=0;
joint(target_r=target_r, stereo=false,distance=0,male=male,cable_dia=cable_dia);
//if(true){
//    translate([0,0,-(15+1.5)+5])
//    cover(tube_dia=target_r, thread_h=15);
//}