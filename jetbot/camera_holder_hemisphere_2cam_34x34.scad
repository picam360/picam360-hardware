
module  minkowski_cube(dimension, r=2)
{
    minkowski()
    {
        cube([dimension.x-r*2,dimension.y-r*2,dimension.z-r*2], center=true);
        sphere(r=r);
    }
}
module camera_mount_hole_2D(size1,size2)
{ 
    minkowski_cube(dimension=size1, r=1, $fn=20);
    minkowski_cube(dimension=size2, r=1, $fn=20);
}
module camera_holder()
{
    difference(){
        //outline
        minkowski_cube(dimension=[38*2+5+5*2,38+5*2,5], r=2, $fn=20);
        
        //camera : outline 38x38, hole 34x34
        camera_bolt_r = 1.7/2;
        for(offset=[[-19-5/2,0,0],[19+5/2,0,0]])
        translate(offset){
            camera_mount_hole_2D(size1=[30,38,100], size2=[38,30,100]);
            for(i=[0:1]){
                mirror([i,0])
                    for(j=[0:1]){
                        mirror([0,j])
                            translate([34/2, 34/2])
                                cylinder(r=camera_bolt_r, h=10+.01, center=true);
                    }
            }
        }
    }
    translate([0,31,3])
    rotate([20,0,0])
    difference(){
        minkowski_cube(dimension=[28,21,4], r=1, $fn=20);
        translate([0,1.7])
            for(i=[0:1]){
                mirror([i,0])
                    for(j=[0:1]){
                        mirror([0,j])
                            translate([21/2, 12.5/2])
                                cylinder(r=2/2, h=10, center=true);
                    }
            }
    }
}
$fn=20;

if(0){
    rotate([0,0,180])
    translate([0,0,52.5])
    import("camera_mount.stl", convexity=3);
    
    translate([0,-48,0])
    camera_holder();
}else{
    camera_holder();
}

 