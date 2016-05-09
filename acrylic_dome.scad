$fn=50;
//projection(cut=true)
rotate([90,90,0])
difference()
{
    sphere(r=50);
    sphere(r=48);
    translate([0,0,-50])
    cube([100,100,100],center=true);
}
 
rotate([180,0,0]){
translate([60,20,0])
text(text = "d=100mm", font = "Liberation Sans", size = 10, valign = 0);
translate([60,0,0])
text(text = "r=50mm", font = "Liberation Sans", size = 10, valign = 0);
translate([60,-20,0])
text(text = "t=2mm", font = "Liberation Sans", size = 10, valign = 0);
}