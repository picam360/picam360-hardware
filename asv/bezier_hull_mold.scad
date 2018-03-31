use <bezier_hull.scad>;

module bezier_hull_mold(refpoints, ratio=15, grid_size=100){
    margin=4/2;
    space=25-margin;
    
    width=ceil((ratio*50+1)/grid_size)*grid_size;
    height=ceil((ratio*100+1)/grid_size)*grid_size;
    depth=100;
    echo(width=width,height=height,depth=depth);
    difference(){
        translate([0,0,(depth-0.2)/2])
        cube([width,height,depth-0.2],center=true);
        translate([0,0,-0.1])
        bezier_hull(scale_points(refpoints,ratio*[1,1,1]),stepz=stepz,step=step);
    }
}

resolution = 100;    
$fn = resolution;

stepz = 17;
step = 30;
view_refpoints = false;

module bezier_hull_mold_x15(){
    height=100;
    ratio=15;
    w1 = 0.9;
    w2 = 0.8;
        
        
    refpoints = [
        [
            [0,50,height/ratio],
            [0,50*w1,0.2*height/ratio],
            [0,50*w2,0]
        ],
        [
            [-36,36,height/ratio],
            [-36*w1,36*w1,0.2*height/ratio],
            [-36*w2,36*w2,0]
        ],
        [
            [-22,-25,height/ratio],
            [-22*w1,-25*w1,0.2*height/ratio],
            [-22*w2,-25*w2,0]
        ],
        [
            [-19,-50,height/ratio],
            [-19*w1,-50*0.98,0.2*height/ratio],
            [-19*w2,-50*0.95,0]
        ],
    ];
    bezier_hull_mold(refpoints, ratio=ratio);
}
bezier_hull_mold_x15();