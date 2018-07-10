//include<params.scad>

module camera_base(){
    difference(){
        translate([-200/2+(100-40/2)/2,0,25/2])
        cube([100-40/2,40,25],center=true);
        translate([0,0,-0.01])
        cylinder(r=120/2+0.4,h=2.01);
    }
    difference(){
        camera_bolt_r = 3.0/2;
        union(){
            translate([-3/2,0,(25+8)/2-8])
            cube([40+3,40,25+8],center=true);
        }
        translate([0,0,100/2-6])
        cube([40.02,40.02,100],center=true);
        //camera : outline 38x38, hole 34x34
        for(i=[0:1]){
            mirror([i,0])
                for(j=[0:1]){
                    mirror([0,j])
                        translate([34/2, 34/2])
                            cylinder(r=camera_bolt_r,h=100,center=true);
                }
        }
    }
    intersection(){
        translate([-10,0,-14])
        rotate([90,0,0])
        cylinder(r=(35-2)*4/3,h=3,center=true,$fn=3);
        translate([0,0,100/2-6.01])
        cube([40,40,100],center=true);
    }
}
$fn=100;
camera_base();
//end of code