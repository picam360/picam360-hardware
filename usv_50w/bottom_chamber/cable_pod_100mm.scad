use<../../lib/ISOThread.scad>
use<../upper_chamber/cable_pod_60mm.scad>
use<cable_stud.scad>

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module cable_pod_100mm(dome_dia=50.8, outer_dia=108, inner_dia=100, tube_thick=2, margin=0.25)
{
    pod_space_h = 20;
    thread_h = 10;
    thread_dia = 72;
    thick = 2;
    key_r=10;
    
    translate([0,0,pod_space_h+thread_h])
    difference(){
        cylinder(r=outer_dia/2, h=thick);
        cylinder(r=thread_dia/2, h=100, center=true);
    }
    translate([0,0,thread_h])
    difference(){
        cylinder(r=outer_dia/2, h=pod_space_h);
        cylinder(r=inner_dia/2+margin, h=100, center=true);
    }
    difference(){
        cylinder(r=outer_dia/2, h=thread_h);
        translate([0,0,-0.01])
        iso_thread(m=inner_dia+4, p=3, t=0.5, l=thread_h+0.02);
        translate([0,0,-0.01])
        cylinder(r1=(inner_dia+4)/2+0.3, r2=(inner_dia)/2, h=4);
    }
    translate([0,0,thread_h+pod_space_h+thick])
    rotate([180,0,0])
    difference(){
        cylinder(r=thread_dia/2+2, h=thread_h);
        translate([0,0,-0.01])
        iso_thread(m=thread_dia, p=3, t=0.5, l=thread_h+0.02);
        translate([0,0,-0.01])
        cylinder(r1=thread_dia/2+0.3, r2=thread_dia/2-2, h=4);
    }
    intersection()
    {
        difference(){
            cylinder(r=112/2, h=pod_space_h+thick+thread_h);
            cylinder(r=108/2-0.01, h=100, center=true);
        }
        //key
        translate([0,0,pod_space_h+thick+thread_h-key_r/2])
        for(i=[0,2])
            rotate([0, 0, i*90])
                rotate([-90, 0, 0])
                    linear_extrude(height=100)
                    hull(){
                        circle(r=key_r/2);
                        translate([0,100])
                        circle(r=key_r/2);
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