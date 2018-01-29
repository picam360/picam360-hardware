include<../params.scad>
use<../tools.scad>
use<base_plate_middle.scad>

module base_plate_bottom(height = 3, raspi_base=false)
{
    linear_extrude(height = height, twist = 0, slices = 0)
    {
        base_plate_bottom_2D(raspi_base=raspi_base);
    }
}
module base_plate_bottom_2D(raspi_base=false)
{
    roundess=3;
    hole_pos = r_from_dia(DOME_DIA)-DOME_THICK-r_from_dia(8)-0;
    difference()
    {
        union()
        {
            difference()
            {
                translate([0, 0, 0])
                    circle(r = r_from_dia(DOME_DIA+30));
                minkowski()
                {
                    $fn=100;
                    difference()
                    {
                        circle(r = r_from_dia(DOME_DIA+16-1));
                        base_plate_inner_2D(margin=roundess,raspi_base=raspi_base);
                    }
                    circle(r = roundess, center=true);
                }
            }
            if(raspi_base){
            //bolt hole for raspi
            translate([0, 0, 0])
                union()
                {
                    for(i=[0,1])
                    for(j=[0,1])
                    minkowski()
                    {
                        $fn=100;
                        rotate([j*180,i*180,0])
                        translate([-58/2, -49/2, 0])
                        circle(r = 5, center=true);
                    }
                }
            }
        }
//        for(i=[0,1])
//        {
//            mirror([i,0])
//                minkowski()
//                {
//                    m_r = 4;
//                    intersection()
//                    {
//                    translate([-hole_pos, 0, 0])
//                        square([1,20-m_r*2], center=true);
//                        circle(r = r_from_dia(DOME_DIA)-DOME_THICK-m_r, center=true);
//                    }
//                        circle(r = m_r, center=true);
//                }
//        }
		//arm
		arm_pos = (DOME_DIA+30)/2-5+PROP_SHROUD_DIA/2;
	    for(i=[0:3])
		{
			rotate([0,0,90*i+45])
			{
			    translate([0, arm_pos])
	        		circle(r = r_from_dia(PROP_SHROUD_DIA));
			}
		}
        if(BASE_PLATE_BOLT > 0)
        {
            //bolt hole for raspi
            for(i=[0,1])
                mirror([0,i]) for(j=[0,1])
                    mirror([j,0]) translate([-58/2, -49/2, 0])
                        circle(r = r_from_dia(BASE_PLATE_BOLT), center=true);
            //bolt hole for arm
            for(i=[0:11])
            {
                translate([(DOME_DIA+20)/2*cos(i*30), (DOME_DIA+20)/2*sin(i*30), 0])
                    circle(r = r_from_dia(BASE_PLATE_BOLT), center=true);
            }            
        }
        
        //rpcm board
        square([51,60], center=true);
    }
}

$fn=360;
translate([(DOME_DIA+30)/2, -(DOME_DIA+30)/2, 0])
    base_plate_bottom_2D();
