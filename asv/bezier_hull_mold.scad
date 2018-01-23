use <bezier_hull.scad>;

module bezier_hull_mold(refpoints, ratio=14, grid_size=100){
    margin=4/2;
    space=25-margin;
    
    width=ceil((ratio*50+1)/grid_size)*grid_size;
    height=ceil((ratio*100+1)/grid_size)*grid_size;
    depth=ratio*10;
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
    
ratio=14;
stepz = 30;
step = 100;
w1 = 0.9;
w2 = 0.7;
    
refpoints = [
    [
        [0,50,10],
        [0,50*w1,2],
        [0,50*w2,0]
    ],
    [
        [-35,30,10],
        [-35*w1,30*w1,2],
        [-35*w2,30*w2,0]
    ],
    [
        [-25,-25,10],
        [-25*w1,-25*0.95,2],
        [-25*w2,-25*0.90,0]
    ],
    [
        [-20,-50,10],
        [-20*w1,-50*0.95,2],
        [-20*w2,-50*0.90,0]
    ],
];

bezier_hull_mold(refpoints, ratio=ratio);