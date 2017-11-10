$fn=100;
module pcb(){
    r_rad=3;
    attach_hole_dimention = 41.8;
    difference(){
        union(){
            minkowski()
            {
                $fn=100;
                r_rad2=r_rad*2;
                translate([r_rad, r_rad])
                    square([65-r_rad*2,56-r_rad*2]);
                circle(r=r_rad);
            }
            intersection(){
                translate([-20, 0])
                square([85,56]);
                translate([85/2, 56/2])
                circle(r=85/2+10);
            }
        }
        translate([85/2, 56/2])
        circle(r=16/2);
        translate([85/2-30, 56/2])
        rotate([0,0,55])
        union(){
            circle(r=10.5/2);
            translate([0,attach_hole_dimention/2])
            circle(r=2.2/2);
            translate([0,-attach_hole_dimention/2])
            circle(r=2.2/2);
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

translate([10, -56])
pcb();