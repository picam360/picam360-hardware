
module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

module skrew_wire_seal(wire_dia=3.5, h=15)
{
    margin=1.5;
    thick=1.5;
    linear_extrude(height=15){
        for(j=[0:3])
        translate([0,j*(wire_dia+margin*2+thick*2+2),0])
        for(i=[-1:1])
        translate([i*(wire_dia+margin*2+thick),0,0])
        difference(){
            circle(r=wire_dia/2+margin+thick);
            circle(r=wire_dia/2+margin);
        }
    }
    linear_extrude(height=0.2)
    difference(){
        hull()
        for(j=[0:3])
        translate([0,j*(wire_dia+margin*2+thick*2+2),0])
        circle(r=wire_dia/2);
        
        for(j=[0:3])
        translate([0,j*(wire_dia+margin*2+thick*2+2),0])
        circle(r=wire_dia/2+margin);
    }
}
$fn=120;
skrew_wire_seal();
 