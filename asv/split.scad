 //-D param=param
target="bezier_hull_mold_x14.stl";
grid_size=100;
x=0;
y=0;
w=800;
h=1500;

module block(grid_size=100,t=1){
    difference(){
        union(){
            cube([grid_size,grid_size,1000],center=true);
            translate([-grid_size/2,0,0])
            cylinder(r=grid_size/4,h=1000,$fn=3,center=true);
            translate([0,-grid_size/2,0])
            rotate([0,0,90])
            cylinder(r=grid_size/4,h=1000,$fn=3,center=true);
        }
        translate([grid_size/2,0,0])
        cylinder(r=grid_size/4+t,h=1001,$fn=3,center=true);
        translate([0,grid_size/2,0])
        rotate([0,0,90])
        cylinder(r=grid_size/4+t,h=1001,$fn=3,center=true);
    }
}
module grid(w=800,h=1500,x=0,y=0,grid_size=100){
    offset_x = -w/2+grid_size/2+x*grid_size;
    offset_y = h/2-grid_size/2-y*grid_size;
    translate([-offset_x,-offset_y,0])
    intersection(){
        import(target);
        translate([offset_x,offset_y,0])
        block(grid_size=grid_size);
    }
}

echo("w:",w,"h:",h,"x:",x,"y:",y);
grid(grid_size=grid_size,w=w,h=h,x=x,y=y);