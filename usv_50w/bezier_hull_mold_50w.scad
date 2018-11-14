use <bezier_hull_50w.scad>;

module _bezier_hull_mold_50w(refpoints, ratio=1, grid_size=100){
    margin=4/2;
    space=25-margin;
    
    width=ceil(ratio*200/grid_size+1)*grid_size;
    height=ceil(ratio*200/grid_size+1)*grid_size;
    depth=100;
    echo(width=width,height=height,depth=depth);
    difference(){
        translate([0,0,(depth-0.2)/2])
        cube([width,height,depth-0.2],center=true);
        translate([0,0,-0.1])
        bezier_hull_50w(scale_points(refpoints,ratio*[1,1,1]),stepz=stepz,step=step);
    }
}

resolution = 100;    
$fn = resolution;

stepz = 44;
step = 102;
view_refpoints = false;

module bezier_hull_mold_50w(){
    height=100;
    ratio=5.6*sqrt(2)/2;
    stepz = 44;
    step = 102;
        
    refpoints = [
        [
            //[r,0,h]
            [100,0,height/ratio],
            [100,0,0.8*height/ratio],
            [90,0,0.2*height/ratio],
            [50,0,0]
        ]
    ];
    _bezier_hull_mold_50w(refpoints, ratio=ratio);
}
bezier_hull_mold_50w();