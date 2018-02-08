 //-D param=param
target="bezier_hull_mold_x14_y0_x0.stl";
grid_size=100;
x=0;
y=0;
w=800;
h=1500;
shell=5;

difference(){
        import(target);
        translate([0,0,-shell])
        scale([(grid_size-shell/2)/grid_size,(grid_size-shell/2)/grid_size,1])
        import(target);
}
module honeycomb_spacer(grid_size=100, h=10, space=23, margin=2){  
    for(i=[-ceil(grid_size/(space+margin)/2)-2:ceil(grid_size/(space+margin)/2)*2]){
        for(j=[-ceil(grid_size/(space+margin)/4)-1:ceil(grid_size/(space+margin)/4)+1]){
            translate([(space+margin)*j*sqrt(3),-(space+margin)*i,h/2])
            cylinder(r=space/2/(sqrt(3)/2),h=h,$fn=6,center=true);
        }
        for(j=[-ceil(grid_size/(space+margin)/4)-1:ceil(grid_size/(space+margin)/4)+1]){
            translate([(space+margin)*j*sqrt(3)+(space+margin)*sqrt(3)/2,-(space+margin)*i-(space+margin)/2,h/2])
            cylinder(r=space/2/(sqrt(3)/2),h=h,$fn=6,center=true);
        }
    }
}
//honeycomb_spacer();
echo("w:",w,"h:",h,"x:",x,"y:",y);
//grid(grid_size=grid_size,w=w,h=h,x=x,y=y);