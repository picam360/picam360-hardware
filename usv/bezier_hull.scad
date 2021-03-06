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
    
module bezier_hull(refpoints,stepz=17,step=30,slice_z=-1,view_refpoints_r=0){
    refpoints_mirror = reverse(scale_points(refpoints,[-1,1,1]));

    if(view_refpoints_r){
        _view_refpoints = concat(refpoints, refpoints_mirror);
        color([1,0,0])
        for (t =[0:len(_view_refpoints)-1])
            for (t2 =[0:len(_view_refpoints[t])-1])
                translate(_view_refpoints[t][t2])
                    sphere(r=view_refpoints_r);
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
ratio=15;
stepz = 44;
step = 102;
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
solar_panel_view=false;
size_view=false;
bezier_hull(scale_points(refpoints,ratio*[1,1,1]),stepz=stepz,step=step,view_refpoints_r=15);
if(solar_panel_view){
    translate([0,-145,height])
    color([0.2,0.2,0.2])
    //cube([540,1060,3],center=true);
    cube([560,1200,3],center=true);
}
if(size_view){
    color([0.2,0.2,0.2])
    cube([725,1500,3],center=true);
}