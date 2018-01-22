
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
    
    