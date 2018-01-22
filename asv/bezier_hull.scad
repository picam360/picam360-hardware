use <../lib/bezier.scad>;

function reverse(array)=[for(i=[0:len(array)-1]) array[len(array)-1-i]];
function join(points)=[
    for (t =[0:len(points)*len(points[0])-1]) points[t/len(points[0])][t%len(points[0])]
    ];
function slice(points,i,p)=[
    for (t =[0:len(points)-1]) points[t][i]
    ];
function scale_points(points, size)=[
    for (t =[0:len(points)-1]) [
        for (t2 =[0:len(points[t])-1]) [points[t][t2].x*size.x,points[t][t2].y*size.y,points[t][t2].z*size.z]
        ]
    ];
function get_refpoints_bezierz(points, step)=[
    for (t =[0:len(points)-1]) bezier(points[t], step)
    ];
    
resolution = 100;    
$fn = resolution;
    
stepz = 17;
step = 30;
w1 = 0.9;
w2 = 0.7;
    
view_refpoints = false;
    
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

module bezier_hull(refpoints){
    refpoints_mirror = reverse(scale_points(refpoints,[-1,1,1]));

    if(view_refpoints){
        _view_refpoints = concat(refpoints, refpoints_mirror);
        color([1,0,0])
        for (t =[0:len(_view_refpoints)-1])
            for (t2 =[0:len(_view_refpoints[t])-1])
                translate(_view_refpoints[t][t2])
                    sphere(r=1);
    }

    refpoints_bezierz = get_refpoints_bezierz(refpoints, stepz);
    refpoints_bezierz_mirror = get_refpoints_bezierz(refpoints_mirror, stepz);
    echo("refpoints:", refpoints);
    echo("refpoints_mirror:", refpoints_mirror);
    numz = len(refpoints_bezierz[0]);
    echo("numz:", numz);
    points = join([
        for(z=[0:numz-1])
            concat(
                bezier(slice(refpoints_bezierz, z),step, s, s=0, e=1),
                bezier(slice(refpoints_bezierz_mirror, z),step, s, s=0, e=1-1/step))
    ]);
    num = len(points)/numz;
    echo("num:", num);
    faces = concat(
        [reverse([for(i=[0:num-1]) i])],
        join([for(z=[0:numz-2])[for(i=[0:num-1]) [z*num+i,z*num+(i+1)%num, (z+1)*num+(i+1)%num,(z+1)*num+i]]]),
        [[for(i=[num*(numz-1):num*numz-1]) i]]
            );
        
    //echo("points:", len(points), points);
    //echo("faces:", len(faces), faces);
     
    polyhedron(points, faces);
}
module block(grid_size=100,t=0.4){
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
ratio = 7;

module bezier_hull(){
    width=ceil((ratio*50+1)/grid_size)*grid_size;
    height=ceil((ratio*100+1)/grid_size)*grid_size;
    depth=ratio*10;
    difference(){
        translate([0,0,(depth-0.2)/2])
        cube([width,height,depth-0.2],center=true);
        translate([0,0,-0.1])
        bezier_hull(scale_points(refpoints,ratio*[1,1,1]));
    }
}
if(false){
translate([0,-160,140])
color([0.2,0.2,0.2])
cube([540,1060,3],center=true);
}
bezier_hull();
