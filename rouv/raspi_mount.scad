include<params.scad>

module raspi_mount()
{
    difference()
    {
        union(){
            translate([0, 0, 11/2-1.6/2])
            linear_extrude(height = 1.6, twist = 0, slices = 0, center=true)
            {
                raspi_mount_2D(raspi_hole=0);
            }
            translate([0, 0, 11/2-1.6-2/2])
            linear_extrude(height = 2, twist = 0, slices = 0, center=true)
            {
                raspi_mount_2D(raspi_hole=2.7);
            }
            translate([0, 0, 11/2-1.6-2-7.4/2])
            linear_extrude(height = 7.4, twist = 0, slices = 0, center=true)
            {
                raspi_mount_2D(raspi_hole=0);
            }
        }
        
        nut_len=7;
        
        rotate([0,0,2*360/32+90])
        translate([0, DOME_DIA/2-nut_len+1, 0.01])
        insert_nut(m=6/2, enter_h=nut_len, exit_h=nut_len, joint=5);
        
        rotate([0,0,2*360/32+90])
        translate([0, DOME_DIA/2-nut_len-0.5, 0.01])
        rotate([90,0,0])
        union(){
            translate([0, 0, -10/2+0.01])
            cylinder(r=2.7/2,h=10,center=true);
            translate([0, 0, 10/2])
            cylinder(r=4.6/2,h=10,center=true);
        }
    }
}
module arc(radius, thick, angle){
	intersection(){
		union(){
			rights = floor(angle/90);
			remain = angle-rights*90;
			if(angle > 90){
				for(i = [0:rights-1]){
					rotate(i*90-(rights-1)*90/2){
						polygon([[0, 0], [radius+thick, (radius+thick)*tan(90/2)], [radius+thick, -(radius+thick)*tan(90/2)]]);
					}
				}
				rotate(-(rights)*90/2)
					polygon([[0, 0], [radius+thick, 0], [radius+thick, -(radius+thick)*tan(remain/2)]]);
				rotate((rights)*90/2)
					polygon([[0, 0], [radius+thick, (radius+thick)*tan(remain/2)], [radius+thick, 0]]);
			}else{
				polygon([[0, 0], [radius+thick, (radius+thick)*tan(angle/2)], [radius+thick, -(radius+thick)*tan(angle/2)]]);
			}
		}
		difference(){
			circle(radius+thick);
			circle(radius);
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
                    thick=3;
                    $fn=100;
                    union()
                    {
                        if(raspi_hole>0){
                        angle = 40.4;
                        angle2 = 1;
                        l2=9;
                        //translate([-DOME_DIA/2-3,0])
                        translate([(DOME_DIA/2-3)*cos(angle+180), (DOME_DIA/2-3)*sin(angle+180)])
                        rotate([0,0,angle])
                        translate([l2/2,0])
                        square([l2,0.1],center=true);
                        
                        rotate([0,0,180+22.5+(angle-22.5-angle2)/2])
                        arc((DOME_DIA/2-3-thick), thick*2, (angle-22.5+angle2));                            
                        }else{
                        angle = 23.5;
                        angle2 = 1;
                        rotate([0,0,180+22.5+(angle-22.5-angle2)/2])
                        arc((DOME_DIA/2-3-thick), thick*2, (angle-22.5+angle2));
                        }
                    }
                    circle(r = thick, center=true);
                }
            }
            circle(r = r_from_dia(DOME_DIA)-3);
        }
        //bolt hole for raspi
        translate([-58/2, -49/2, 0])
        circle(r = raspi_hole/2, center=true);
        //rpcm board
        square([51,60], center=true);        
    }
}

module insert_nut(m=6/2, enter_h=9, exit_h=9, joint=2){
    translate([0,enter_h/2-0.01,0])
    rotate([90,0])
    cylinder(r=m,h=enter_h,center=true,$fn=6);
    translate([0,enter_h+joint+exit_h/2-0.2,0])
    rotate([90,0])
    cylinder(r=m,h=exit_h,center=true,$fn=6);
}

$fn=360;

//                //minkowski()
//                {
//                    $fn=100;
//                    union()
//                    {
//                        angle = 40;
//                        l2=11.5;
//                        //translate([-DOME_DIA/2-3,0])
//                        translate([(DOME_DIA/2-3)*cos(angle+180), (DOME_DIA/2-3)*sin(angle+180)])
//                        rotate([0,0,angle])
//                        translate([l2/2,0])
//                        square([l2,0.1],center=true);
//                        
//                        rotate([0,0,180+22.5+(angle-22.5)/2])
//                        arc((DOME_DIA/2-3-1), 1, (angle-22.5));
//                    }
//                    circle(r = 3.6, center=true);
//                }

raspi_mount(height=11, raspi_hole=2.7);
//raspi_mount_2D(raspi_hole=0);
//raspi_mount_inner_2D(margin=3);