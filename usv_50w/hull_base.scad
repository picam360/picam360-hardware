use<../lib/ISOThread.scad>
use<cable_pod_100mm.scad>
use<cable_stud.scad>

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module hull_base(dome_dia=50.8, outer_dia=112, inner_dia=108, tube_thick=2, margin=0.25)
{
    pod_space_h = 0;
    thread_h = 10;
    connector_r = 45;
    thick = 2;
    margin=0.4;
    key_r=10.3;
    
    translate([0,0,pod_space_h+thread_h])
    difference(){
        linear_extrude(height=thick)
        minkowski_square([outer_dia,outer_dia], r=10);
        cylinder(r=(connector_r+8)/2+margin, h=100, center=true);
    }
    translate([0,0,thread_h])
    difference(){
        cylinder(r=outer_dia/2, h=pod_space_h);
        cylinder(r=inner_dia/2+margin, h=100, center=true);
    }
    difference(){
        cylinder(r=outer_dia/2, h=thread_h);
        translate([0,0,-0.01])
        cylinder(r=inner_dia/2+margin, h=100, center=true);
        //key
        translate([0,0,thread_h-key_r/2])
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
hull_base();
//translate([0,0,-5])
//cable_pod_100mm();
//translate([0,0,-30])
//pod_cover_100mm();
//cable_stud();