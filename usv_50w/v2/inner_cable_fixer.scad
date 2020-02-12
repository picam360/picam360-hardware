
module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}
module line_taper(r=5,l=5)
{
    //translate([-r/2,0,r])
    rotate([0,90,180])
    translate([-r,-r,-l/2])
    difference(){
        cube([r,r,l]);
        translate([0,0,-0.01])
        cylinder(r=r,h=l+0.02);
    }
}
module inner_cable_fixer()
{
    difference(){
        union(){
            linear_extrude(height=5,center=true)
            minkowski_square([20,5]);
            
            for(i=[0,1])
                mirror([i,0])
                translate([6,0,0])
                rotate([90,0,0])
                cylinder(r=10/2, h=5, center=true);
        }
        for(i=[0,1])
            mirror([i,0])
            translate([6,0,0])
            rotate([90,0,0])
            cylinder(r=5/2, h=100, center=true);
        
        cylinder(r=1.7/2, h=100, center=true);
    }
}

$fn=120;

difference(){
    inner_cable_fixer();
    translate([0,0,-100/2])
    cube([100,100,100], center=true);
}
