use<cover.scad>
use <../lib/ISOThread.scad>

module holder(tube_dia=111, thread_h=10+16.5, margin=0.25)
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
module thread(tube_dia=100, thread_h=10, margin=0.25)
{
    dome_dia=46;
    tube_thick=2;
    outer_dia=tube_dia+10;
    thread_dia=tube_dia+10+4;
    t=0.5;
    upper_thick = 1.5;
    difference(){
        union(){
            translate([0, 0, thread_h])
            intersection()
            {
                cylinder(r=outer_dia/2+0.5,h=upper_thick);
                translate([0, 0, -4])
                scale([1,1,0.25])
                if(tube_dia==60)
                    sphere(r=outer_dia/1.77);
                else if(tube_dia==100)
                    sphere(r=outer_dia/1.9);
            }
            iso_thread(m=thread_dia, l=thread_h, p=3);
        }
        translate([0, 0, -0.01])
        cylinder(r=thread_dia/2-4,h=thread_h+0.01);
        cylinder(r=tube_dia/2-8,h=100,center=true);
//        translate([0,0,-0.01])
//        iso_thread(m=thread_dia, l=thread_h+0.02, p=3, t=t);
        //6cube([100,100,100]);
    }
//    difference(){
//        translate([0, 0, thread_h])
//        mirror([0,0,1])
//        cylinder(r=tube_dia/2-tube_thick-0.5,h=1);
//        cylinder(r=dome_dia/2,h=100,center=true);
//        cylinder(r=tube_dia/2-8,h=100,center=true);
//    }
}
module stereo_joint(distance=34.5)
{
    stereo=true;
    color([1,0,0])
    difference(){
        linear_extrude(height=3){
            hull(){
                translate([0,40])
                circle(r=8);
                translate([0,-20])
                circle(r=5);
            }
            translate([0,-40])
            circle(r=8);
        }
        translate([distance,0])
            cylinder(r=67/2,h=100,center=true);
        translate([-distance,0])
            cylinder(r=67/2,h=100,center=true);
    }
    difference(){
        union(){
            translate([distance,0,10+1.5])
                rotate([180,0,0])
                    cover(tube_dia=60, thread_h=10);
            translate([distance,0,0])
                cylinder(r=60/2,h=1.48);
            if(stereo){
                translate([-distance,0,10+1.5])
                rotate([180,0,0])
                cover(tube_dia=60, thread_h=10);
                translate([-distance,0,0])
                    cylinder(r=60/2,h=1.48);
            }
            cylinder(r1=107/2,r2=102/2,h=1.48);
        }
        union(){
            translate([distance,0,0])
            cylinder(r=60/2-7,h=100,center=true);
            if(stereo){
                translate([-distance,0,0])
                cylinder(r=60/2-7,h=100,center=true);
            }
        }
    }
}

$fn=120;

part="holder";
if(part=="stereo_joint"){
    stereo_joint(distance=34.5);
}else if(part=="thread"){
    thread(tube_dia=100, thread_h=10, margin=0.25);
}else if(part=="holder"){
    holder();
}else{
    translate([0,0,12])
    stereo_joint(distance=34.5);
    thread(tube_dia=100, thread_h=10, margin=0.25);
    translate([0,0,-12])
    cover(tube_dia=100, thread_h=10, margin=0.25);
    translate([0,0,10])
    rotate([180,0,0])
    holder();
}