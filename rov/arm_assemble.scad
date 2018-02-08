include<../params.scad>
use<arm.scad>
use<arm_upper.scad>
use<prop_shroud_flange.scad>

is_sphere = false;

$fn=360;

radius=26.2;
height=21+3*2;
angle=0;

module arm_assemble(rotate=[0,0,0]){
    arm_pos = (DOME_DIA+30)/2-5+PROP_SHROUD_DIA/2;
    angle2=(abs(rotate.y) == 45)?45:0;
    shift=(abs(rotate.y) == 45)?17:(abs(rotate.y) == 180)?4:0;
    translate([0,shift+arm_pos,0]){
        difference(){
            union(){
                translate([0,-shift,0])
                difference(){
                    arm(height=height, margin=0, minkowski_fn=360);
                    translate([0,-82.47,(height-21)/2])
                    difference(){
                        cylinder(r=(DOME_DIA+30)/2,h=21);
                        translate([0, arm_pos])
                            cylinder(r = r_from_dia(PROP_SHROUD_DIA),h=21);
                    }
                }
                translate([0,0,height/2])
                    rotate(rotate)
                    if(is_sphere){
                        sphere(r=radius,center=true);
                    }else{
                        cylinder(r=22.48+2,h=height,center=true);
                    }
            }
            rotate([0,0,-angle2])
            translate([0,0,height/2])
                rotate(rotate)
                    intersection(){
                        cylinder(r=22.48,h=100,center=true);
                        //scale([1,1,3])
                        //sphere(r=radius/1.135,center=true);
                    }
        }
        rotate([0,0,-angle2])
        translate([0,0,height/2])
            rotate(rotate)
                translate([0,0,(rotate.y>0)?-13:13-3])
                prop_shroud_flange(margin=-2.3, atachement=[2,4,6]);
    }
}

arm_assemble(rotate=[0,angle,0]);