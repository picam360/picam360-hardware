include<../params.scad>
use<arm.scad>
use<arm_upper.scad>
use<prop_shroud_flange.scad>

is_sphere = true;

$fn=360;

shift=17;
radius=26;
height=27;

module arm_assemble(rotate=[45,0,0]){
    difference(){
        union(){
            rotate([0,0,45])
            translate([0,-shift,0])
            difference(){
                arm(height=height, margin=0, minkowski_fn=360);
                translate([0,-82.47,(height-21)/2])
                difference(){
                    cylinder(r=(DOME_DIA+30)/2,h=21);
		            arm_pos = (DOME_DIA+30)/2-5+PROP_SHROUD_DIA/2;
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
        translate([0,0,height/2])
            rotate(rotate)
                intersection(){
                    cylinder(r=23,h=100,center=true);
                    //scale([1,1,3])
                    //sphere(r=radius/1.135,center=true);
                }
    }
    translate([0,0,height/2])
        rotate(rotate)
            translate([0,0,-13])
            prop_shroud_flange(margin=-2.51, atachement=[2,4,6]);
}

arm_assemble(rotate=[0,45,0]);