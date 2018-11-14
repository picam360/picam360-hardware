use <../lib/bezier.scad>;
use <prop.scad>;

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
function project2d(points)=[
    for (t =[0:len(points)-1]) [points[t].x,points[t].y]
    ];
function get_refpoints_bezierz(points, step)=[
    for (t =[0:len(points)-1]) bezier(points[t], step)
    ];
    
module bezier_hull_50w(refpoints,stepz=17,step=30,slice_z=-1,view_refpoints_r=0){

    if(view_refpoints_r){
        color([1,0,0])
        for (t =[0:len(refpoints[0])-1])
            translate(refpoints[0][t])
                sphere(r=view_refpoints_r);
    }

    refpoints_bezierz = bezier(refpoints[0], stepz);
    echo("refpoints:", refpoints);
    numz = len(refpoints_bezierz);
    echo("numz:", numz);
    points = join([
        for(z=[0:numz-1])
            [for(i=[0:step-1])[refpoints_bezierz[z][0]*cos(i*360/step),refpoints_bezierz[z][0]*sin(i*360/step),refpoints_bezierz[z][2]]]
    ]);
    num = len(points)/numz;
    echo("num:", num);
    if(slice_z<0){
        faces = concat(
            [reverse([for(i=[0:num-1]) i])],
            join([for(z=[0:numz-2])[for(i=[0:num-1]) [z*num+i,z*num+(i+1)%num, (z+1)*num+(i+1)%num,(z+1)*num+i]]]),
            [[for(i=[num*(numz-1):num*numz-1]) i]]
                );
        polyhedron(points, faces);
    }else{
        faces = [[for(i=[num*slice_z:num*(slice_z+1)-1]) i]];
        polygon(project2d(points), faces);
    }
        
    //echo("points:", len(points), points);
    //echo("faces:", len(faces), faces);
}

resolution = 100;    
$fn = resolution;

height=100;
ratio=5.6*sqrt(2)/2;
stepz = 44;
step = 102;
w1 = 0.9;
w2 = 0.8;
    
refpoints = [
    [
        //[r,0,h]
        [100,0,height/ratio],
        [100,0,0.8*height/ratio],
        [90,0,0.2*height/ratio],
        [50,0,0]
    ]
];
solar_panel_view=true;
size_view=false;
bezier_hull_50w(scale_points(refpoints,ratio*[1,1,1]),stepz=stepz,step=step,view_refpoints_r=15);
if(solar_panel_view){
    translate([0,0,height])
    color([0.2,0.2,0.2])
    //cube([540,1060,3],center=true);
    cube([560,560,3],center=true);
}
if(size_view){
    color([0.2,0.2,0.2])
    cylinder(r=560*sqrt(2)/2, h=3,center=true);
}