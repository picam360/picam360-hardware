include<params.scad>

module air_bent()
{
    h=12;
    difference(){
        union(){
            intersection(){
                cylinder(r=3/2, h=h);
                scale([1,1,2])
                sphere(r=h/2);
            }
            cylinder(r=10/2, h=0.3);
        }
        cylinder(r=1.5/2, h=100, center=true);
    }
}
$fn=120;
air_bent();
 