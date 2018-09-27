$fn=100;
cam_mod_size = 30;
cam_mod_thick = 12;
module camera_holder() {
    difference(){
        cylinder(r=30, h=30/2+5);
        for(i=[0:2])
        rotate(120*i)
        translate([0,15])
        {
            cube([cam_mod_size+0.2, cam_mod_thick+0.2, cam_mod_size+0.2],center=true);
            cube([cam_mod_size-5, cam_mod_thick-5, 100],center=true);
            rotate([-90,0,0])
            cylinder(r=12/2,h=20);
        }
    }
}
if(0){
    camera_holder();
}else{
    camera_holder();
}
