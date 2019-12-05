use <../../lib/ISOThread.scad>
use<../../camera_pod/cover.scad>

module adapter_60mm_holder(tube_dia=71, thread_h=10+9.5, margin=0.25)
{
    outer_dia=tube_dia+7;
    thread_dia=tube_dia+3;
    t=0.5;
    upper_thick = 1.5;
    difference(){
        union(){
            translate([0, 0, thread_h])
            intersection()
            {
                cylinder(r=outer_dia/2,h=upper_thick);
                translate([0, 0, -4])
                scale([1,1,0.25])
                    sphere(r=outer_dia/1.8);
            }
            cylinder(r=outer_dia/2,h=thread_h);
        }
        cylinder(r=tube_dia/2-2,h=100,center=true);
        translate([0,0,-0.01])
        iso_thread(m=thread_dia, l=thread_h+0.02, p=3, t=t);
        translate([0,0,-0.01])
        cylinder(r1=thread_dia/2+t, r2=thread_dia/2-2+t, h=4);
        
        //gizagiza
        for(i=[0:31])
        rotate(i*360/32)
        translate([outer_dia/2+5.2, 0, 0])
        cylinder(r=5.5,h=100,center=true);
        //6cube([100,100,100]);
    }
}
 

$fn=120;
if(false){
    difference(){
        union(){
            cable_pod_60mm();
            translate([0,0,60])
            cover(tube_dia=68, thread_h=20);
        }
        cube([200,200,200]);
    }
}else{
    adapter_60mm_holder();
}
 
//translate([0,0,-10])
//cable_stud();