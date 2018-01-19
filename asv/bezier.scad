
function choose(n, k)=
     k == 0? 1
    : (n * choose(n - 1, k - 1)) / k;
 
function _point_on_bezier_rec(points,t,i,c)=
    len(points) == i ? c
    : _point_on_bezier_rec(points,t,i+1,c+choose(len(points)-1,i) * pow(t,i) * pow(1-t,len(points)-i-1) * points[i]);
 
function _point_on_bezier(points,t)=
    _point_on_bezier_rec(points,t,0,[0,0,0]);
 
function bezier(points,resolution,s=0,e=1)=[
    for (t =[s:1.0/resolution:e]) _point_on_bezier(points,t)
    ];
    
function join(points)=[
    for (t =[0:len(points)*len(points[0])-1]) points[t/len(points[0])][t%len(points[0])]
    ];
function slice(points,i,p)=[
    for (t =[0:len(points)-1]) points[t][i]
    ];
function mirrorx_points(points)=[
    for (t =[0:len(points)-1]) [
        for (t2 =[0:len(points[len(points)-1-t])-1]) [-points[len(points)-1-t][t2].x,points[len(points)-1-t][t2].y,points[len(points)-1-t][t2].z]
        ]
    ];
function get_refpoints_bezierz(points, step)=[
    for (t =[0:len(points)-1]) bezier(points[t], step)
    ];
    
resolution = 100;    
$fn = resolution;
    
stepz = 10;
step = 30;
w1 = 0.9;
w2 = 0.7;
    
view_refpoints = false;
    
refpoints = [
    [
        [0,50,38],
        [0,50*w1,15],
        [0,50*w2,0]
    ],
    [
        [-30,0,30],
        [-30*w1,0,15],
        [-30*w2,0,-5]
    ],
    [
        [-25,-25,30],
        [-25*w1,-25*0.95,15],
        [-25*w2,-25*0.90,10]
    ],
    [
        [-15,-50,30],
        [-15*w1,-50*0.95,15],
        [-15*w2,-50*0.90,10]
    ],
];
refpoints_mirror = mirrorx_points(refpoints);

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
    [[for(i=[0:num-1]) i]],
    join([for(z=[0:numz-2])[for(i=[0:num-1]) [z*num+i,z*num+(i+1)%num, (z+1)*num+(i+1)%num,(z+1)*num+i]]]),
    [[for(i=[num*(numz-1):num*numz-1]) i]]
        );
    
//echo("points:", len(points), points);
//echo("faces:", len(faces), faces);
 
 
polyhedron(points, faces);