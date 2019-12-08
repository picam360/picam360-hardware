//include<params.scad>

use <../../lib/ISOThread.scad>;

module thruster()
{
    rotate(45)
    translate([-48.4,-50,-40])
    import("T100-Thruster-R1-Public.stl");
                for(angle=[0,90,180,270])
                rotate(angle)
                {
                    rotate([90,0,135])
                    rotate([0,0,45])
                    for(i=[0:1]){
                        mirror([i,0])
                            for(j=[0:1]){
                                mirror([0,j])
                                {
                                    translate([13.5/2,13.5/2])
                                        cylinder(r=3/2,h=100);
                                }
                            }
                    }
                }
}
module skrew_stand()
{
    rotate([90,0,0])
    linear_extrude(height=10, center=true)
        difference(){
            minkowski(){
                radius1=10/2;
                union(){
                    radius=46;
                    points = [
                        for(a = [60:1:120]) [radius * cos(a), radius * sin(a)-46]
                    ];
                    polygon(concat([[0, 46]], points));
                }
                circle(r=radius1);
            }
            minkowski(){
                radius1=5/2;
                union(){
                    radius=52;
                    points = [
                        for(a = [60+11:1:120-11]) [radius * cos(a), radius * sin(a)-46]
                    ];
                    polygon(concat([[0, 42]], points));
                }
                circle(r=radius1);
            }
            translate([0,-46])
                circle(r=46);
        }
}
$fn=120;
if(false){
    //rotate([0,0,45+90*i])
    translate([0,5,-46])
    rotate([90+180,0,0])
    translate([-48,-48,-40])
    import("T100-Thruster-R1-Public.stl");
}
//color([0.5,0.5,0.5,0.8])
//translate([115/2,0,0])
skrew_stand();