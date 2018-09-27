 //-D param=param
use <bezier_hull_mold.scad>

//target="bezier_hull_mold_x15/bezier_hull_mold_x15.stl";
grid_size=100;
x=0;
y=0;
w=800;
h=1500;

module block(grid_size=100,t=1.0,left=true,right=true,top=true,top=true,bottom=true){
    translate([0,0,100/2])
    difference(){
        union(){
            cube([grid_size,grid_size,100],center=true);
            if(left)
            translate([-grid_size/2,0,0])
            cylinder(r=grid_size/5,h=100,$fn=3,center=true);
            if(bottom)
            translate([0,-grid_size/2,0])
            rotate([0,0,90])
            cylinder(r=grid_size/5,h=100,$fn=3,center=true);
        }
        if(right)
        translate([grid_size/2,0,0])
        cylinder(r=grid_size/5+t,h=100.2,$fn=3,center=true);
        if(top)
        translate([0,grid_size/2,0])
        rotate([0,0,90])
        cylinder(r=grid_size/5+t,h=100.2,$fn=3,center=true);
    }
}
module grid(w=800,h=1500,x=0,y=0,grid_size=100,t=1){
    offset_x = -w/2+grid_size/2+x*grid_size;
    offset_y = h/2-grid_size/2-y*grid_size;
    intersection(){
        block(grid_size=grid_size,left=(x!=0),top=(y!=0),right=(x!=w/grid_size-1),bottom=(y!=h/grid_size-1),t=t);
        translate([-offset_x,-offset_y,0])
//        if(target){
//            echo(target);
//            import(target);
//        }else{
            bezier_hull_mold_x15();
//        }
    }
}
echo("w:",w,"h:",h,"x:",x,"y:",y);
grid(grid_size=grid_size,w=w,h=h,x=x,y=y,t=4);