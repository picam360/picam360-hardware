use<cover.scad>

module stereo_adapter(stereo=false, distance=0)
{
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
        intersection(){
            union(){
                translate([distance,0,0])
                cylinder(r=60/2-7,h=100,center=true);
                if(stereo){
                    translate([-distance,0,0])
                    cylinder(r=60/2-7,h=100,center=true);
                }
            }
            cylinder(r=100/2-8,h=100,center=true);
        }
    }
}

$fn=120;

stereo=false;
if(stereo){
    stereo_adapter(stereo=true,distance=34.5);
}else{
    stereo_adapter(stereo=false,distance=0);
}
//if(true){
//    translate([0,0,-(15+1.5)])
//    cover(tube_dia=100, thread_h=15);
//}