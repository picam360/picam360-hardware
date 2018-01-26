$fn=100;
thick=20;
radius=30;
theta=15;

rotate([90,0,0])
union(){
difference(){
cylinder(r=radius/2, h=thick, center=true);
    rotate_extrude()
        translate([radius/2,0,0])
        circle(r=thick/2);
}
    for(i=[0,1])
    mirror([0,0,i])
    translate([0,0,thick/2])
    linear_extrude(height = 2, center = true)
    hull() {
        translate([(radius/2-radius/3)*tan(90-theta),0,thick/2]) circle(r=radius/3);
        circle(r=radius/2);
    }
}
    translate([(radius/2-radius/3)*tan(90-theta)+9,0,0])
    linear_extrude(height = 2, center = true)
difference(){
    hull() {
        translate([(radius/2-radius/3)*tan(90-theta),0,thick/2]) circle(r=thick/3);
        circle(r=thick/2+1);
    }
    translate([-thick*1.23,0,0])
    circle(r=thick);
    translate([(radius/2-radius/3)*tan(90-theta),0,0])
    circle(r=3/2);
}