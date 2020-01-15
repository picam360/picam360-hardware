use <../../lib/ISOThread.scad>;

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module camera_pod_cover(dome_dia=50.8, outer_dia=108, inner_dia=106, tube_thick=2, margin=0.25)
{
    t=0.5;
    thread_h=7;
    upper_thick = 3;
    difference(){
        union(){
            translate([0, 0, thread_h])
            intersection()
            {
                cylinder(r=outer_dia/2+3.5,h=upper_thick);
                translate([0, 0, -4])
                scale([1,1,0.25])
                sphere(r=inner_dia/1.7);
            }
            cylinder(r=outer_dia/2+3.5,h=thread_h);
        }
        //cylinder(r=inner_dia/2+margin,h=100,center=true);
        translate([0,0,-0.01])
        iso_thread(m=outer_dia, l=thread_h+upper_thick+0.02, p=3, t=t);
        translate([0,0,-0.01])
        cylinder(r1=outer_dia/2+t, r2=outer_dia/2+t-2, h=4);
        for(i=[0:31])
        rotate(i*360/32)
        translate([outer_dia/2+8, 0, 0])
        cylinder(r=5.5,h=100,center=true);
        //cube([100,100,100]);
    }
}

$fn=120;
camera_pod_cover();
 