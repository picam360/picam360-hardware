use <../lib/ISOThread.scad>;

module bezier_hull_mold_50w_printable(){
    space=10;
    wide=15;
    angle=40;
    h1=70;
    h2=0;
    h3=0;
    pos1=400-25;
    pos2=pos1-h1*tan(90-angle)-space;
    pos3=pos2-h2*tan(90-angle)-space;
    difference(){
        union(){
            difference(){
                import("bezier_hull_mold_50w.stl");
                translate([0,0,-0.01])
                rotate(-wide/2-1.4)
                rotate_extrude(angle=wide)
                polygon(points=[[pos1-h1*tan(90-angle),0],[pos1,0],[pos1,h1]]);
                translate([0,0,-0.01])
                rotate(-wide/2-1.4)
                rotate_extrude(angle=wide)
                polygon(points=[[pos2-h2*tan(90-angle),0],[pos2,0],[pos2,h2]]);
                translate([0,0,-0.01])
                rotate(-wide/2-1.4)
                rotate_extrude(angle=wide)
                polygon(points=[[pos3-h3*tan(90-angle),0],[pos3,0],[pos3,h3]]);
            }
//            translate([775/2,0,0])
//            cylinder(r=25/2,h=100);
        }
        translate([775/2,0,-0.01])
            iso_thread(m=8, t=0.3, l=100+0.02);
    }
}

resolution = 100;    
$fn = resolution;

bezier_hull_mold_50w_printable();