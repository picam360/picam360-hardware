use<extlens_holder1.scad>
use<extlens_holder2.scad>
use<extlens_holder3.scad>

thickness=3;
outer_radius=25.0/2;
$fn=1000;
//difference()
{
    union(){
        translate([0,0,-thickness])
        linear_extrude(height = 3, twist = 0, slices = 0)
        {
            extlens_holder3(outer_radius, 19.2/2);
        }
        linear_extrude(height = 3, twist = 0, slices = 0)
        {
            extlens_holder3(outer_radius, 13.8/2);
        }
    }
//    translate([0,0,3])
//    fillet();
//    translate([0,0,-3])
//    rotate([180,0,0])
//    fillet();
}


module fillet(radius=0.5, smooth=100)
{
    rotate_extrude(convexity=10, $fn = smooth)
    translate([outer_radius,0,0])
    translate([-radius+0.01,-radius+0.01,0])
    difference()
    {
        square([radius,radius]);
        circle(r=radius,$fn=smooth);
    }
}