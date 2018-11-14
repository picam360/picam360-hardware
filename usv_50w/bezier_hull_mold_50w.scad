use <bezier_hull_50w.scad>;

module bezier_hull_mold_50w(grid_size=100){
    margin=4/2;
    space=25-margin;
    
    width=ceil(800/grid_size)*grid_size;
    height=ceil(800/grid_size)*grid_size;
    depth=100;
    echo(width=width,height=height,depth=depth);
    difference(){
        translate([0,0,(depth-0.2)/2])
        cube([width,height,depth-0.2],center=true);
        translate([0,0,-0.1])
        bezier_hull_50w();
    }
}

resolution = 100;    
$fn = resolution;

bezier_hull_mold_50w();