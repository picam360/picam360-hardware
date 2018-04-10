
module dome_upper_stand()
{
    h=50;
    r=5;
    pin_r=47;
    intersection(){
        for(i=[0:7])
        translate([pin_r/2*cos(i*360/8),pin_r/2*sin(i*360/8),0])
        scale([1,1,(h*2)/10])
        sphere(r=r/2, h=(h*2)/5);
        
        translate([0,0,100/2])
        cube([100,100,100],center=true);
    }
    difference(){
        cylinder(r=(pin_r+r)/2, h=2,center=true);
        cylinder(r=(pin_r-r)/2, h=100,center=true);
    }
    translate([pin_r/2+30/2,0,0])
    cube([30,r,2],center=true);
}
$fn=36;

dome_upper_stand();