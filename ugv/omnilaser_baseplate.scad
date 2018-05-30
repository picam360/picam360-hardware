$fn=100;
motor_distance = 32;
attach_hole_dimention = 41.8;
module omnilaser_baseplate(){
    r_rad=3;
    difference(){
        intersection(){
            translate([-10, 0])
            square([105,56]);
            translate([85/2, 56/2])
            circle(r=85/2+15/2);
        }
        
        translate([85/2, 56/2])
        union(){
            circle(r=12/2+0.1);
            square([2,16],center=true);
        }
        
        translate([85/2-motor_distance, 56/2])
        rotate([0,0,0])
        union(){
            circle(r=10.4/2);
            translate([0,attach_hole_dimention/2])
            circle(r=2.2/2);
            translate([0,-attach_hole_dimention/2])
            circle(r=2.2/2);
//            translate([attach_hole_dimention/2,0])
//            circle(r=2.2/2);
//            translate([-attach_hole_dimention/2,0])
//            circle(r=2.2/2);
        }
        
        translate([85/2+motor_distance, 56/2])
        rotate([0,0,0])
        union(){
            circle(r=10.4/2);
            translate([0,attach_hole_dimention/2])
            circle(r=2.2/2);
            translate([0,-attach_hole_dimention/2])
            circle(r=2.2/2);
//            translate([attach_hole_dimention/2,0])
//            circle(r=2.2/2);
//            translate([-attach_hole_dimention/2,0])
//            circle(r=2.2/2);
        }
        //raspi attachemnt holes
        raspi_bolt_r = 2.7/2;
        translate([3.5, 3.5])
        circle(r=raspi_bolt_r);
        translate([61.5, 3.5])
        circle(r=raspi_bolt_r);
        translate([3.5, 52.5])
        circle(r=raspi_bolt_r);
        translate([61.5, 52.5])
        circle(r=raspi_bolt_r);
        
    }
}
module raspi(){
    r_rad=3;
    difference(){
        minkowski()
        {
            $fn=100;
            r_rad2=r_rad*2;
            translate([r_rad, r_rad])
                square([85-r_rad*2,56-r_rad*2]);
            circle(r=r_rad);
        }
        //raspi attachemnt holes
        raspi_bolt_r = 2.7/2;
        translate([3.5, 3.5])
        circle(r=raspi_bolt_r);
        translate([61.5, 3.5])
        circle(r=raspi_bolt_r);
        translate([3.5, 52.5])
        circle(r=raspi_bolt_r);
        translate([61.5, 52.5])
        circle(r=raspi_bolt_r);
    }
}

if(0){
translate([15/2, -56])
{
    omnilaser_baseplate();
    for(i=[-1,1])
        color("grey")
        translate([85/2-motor_distance*i, 56/2,-16-2])
        cylinder(r=35/2,h=16);
}
}else{
    translate([15/2, -56])
    omnilaser_baseplate();
}