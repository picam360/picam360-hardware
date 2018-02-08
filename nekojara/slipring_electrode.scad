use <../lib/ISOThread.scad>;
$fn=100;

module slipring_electrode(r=18, width=3, attach_margin=5, h=0) {
    if(h==0){
        difference(){
            circle(r=r+width/2);
            circle(r=r-width/2);
        }
    }else{
        difference(){
            cylinder(r=r+width/2,h=h);
            cylinder(r=r-width/2,h=h);
        }
    }
    if(attach_margin!=0){
        for(i=[0]){
            rotate([0,0,i*90+45])
            translate([0,r+attach_margin/2])
            if(attach_margin>0){
                square([width,width+attach_margin],center=true);
            } else{
                square([width,width-attach_margin],center=true);
            }
        }
    }
}

gear_act = 2.18894;
gear_edge = 12-gear_act;

 translate([25,-25])
slipring_electrode(r=17, attach_margin=-5);
 translate([25,-25])
slipring_electrode(r=23);
