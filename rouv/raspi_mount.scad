include<params.scad>
use<../lib/arc.scad>

module raspi_mount(offset=0)
{
    h1=3;
    h2=8;
    difference()
    {
        union(){
            translate([0, 0, 11/2-offset-h1/2])
            linear_extrude(height = h1, twist = 0, slices = 0, center=true)
            {
                raspi_mount_2D(raspi_hole=2.7);
            }
            translate([0, 0, 11/2-offset-h2/2-h1])
            linear_extrude(height = h2, twist = 0, slices = 0, center=true)
            {
                raspi_mount_2D(raspi_hole=6);
            }
            translate([0, 0, 0])
            linear_extrude(height = 11, twist = 0, slices = 0, center=true)
            {
                raspi_mount_2D(raspi_hole=0);
            }
        }
        
        rotate([0,0,2*360/32+90])
        translate([0, DOME_DIA/2-3-2, 0.01])
        rotate([90,0,0])
        union(){
            translate([0, 0, -10/2+0.01])
            cylinder(r=3.2/2,h=10,center=true);
            translate([0, 0, 10/2])
            cylinder(r=6.2/2,h=10,center=true);
        }
    }
}
module raspi_mount_2D(raspi_hole=2.7)
{
    difference()
    {
        intersection()
        {
            union(){
                minkowski()
                {
                    thick=4;
                    $fn=100;
                    union()
                    {
                        if(raspi_hole>0){
                            angle = 40.4;
                            angle2 = 2;
                            l2=9;
                            //translate([-DOME_DIA/2-3,0])
                            translate([(DOME_DIA/2-3)*cos(angle+180), (DOME_DIA/2-3)*sin(angle+180)])
                            rotate([0,0,angle])
                            translate([l2/2,0])
                            square([l2,0.1],center=true);
                            
                            rotate([0,0,180+22.5+(angle-22.5-angle2)/2])
                            arc((DOME_DIA/2-3-thick/2), thick, (angle-22.5+angle2));                            
                        }else{
                            angle = 24.5;
                            angle2 = 2;
                            rotate([0,0,180+22.5+(angle-22.5-angle2)/2])
                            arc((DOME_DIA/2-3-thick/2), thick, (angle-22.5+angle2));
                        }
                    }
                    circle(r = thick, center=true);
                }
            }
            circle(r = r_from_dia(DOME_DIA)-3);
        }
        //bolt hole for raspi
        if(raspi_hole>5){
            translate([-58/2, -49/2, 0])
            rotate(-30)
            circle(r = raspi_hole/2, center=true, $fn=6);
        }else if(raspi_hole>0){
            translate([-58/2, -49/2, 0])
            circle(r = raspi_hole/2, center=true);
        }
        //rpcm board
        square([51,60], center=true);        
    }
}

$fn=360;

raspi_mount(height=11, raspi_hole=2.7);
//raspi_mount_2D(raspi_hole=0);
////raspi_mount_inner_2D(margin=3);