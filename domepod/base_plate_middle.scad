include<../params.scad>

module base_plate_middle()
{
    linear_extrude(height = 5, twist = 0, slices = 0)
    {
        base_plate_middle_2D();
    }
}
module base_plate_middle_2D()
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
                    _fn=$fn;
                    $fn=100;
                    difference()
                    {
                        circle(r = r_from_dia(DOME_DIA+16-1));
                        base_plate_inner_2D(margin=roundess, $fn=_fn);
                    }
                    circle(r = roundess, center=true);
                }
            }
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
        for(i=[0,1])
        {
            mirror([i,0])
            translate([-hole_pos, 0, 0])
                minkowski()
                {
                    m_r = 4;
                    translate([-20, 0])
                        square([40,15-m_r*2], center=true);
                    circle(r = m_r, center=true);
                }
        }        
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
module base_plate_inner_2D(margin=0)
{
    hole_pos = r_from_dia(DOME_DIA)-DOME_THICK-r_from_dia(8)-0;
    difference()
    {
        translate([0, 0, 0])
            circle(r = r_from_dia(DOME_DIA+16));
        translate([0, 0, 0])
            circle(r = r_from_dia(DOME_DIA)-DOME_THICK-margin);
    }
    //hole
    for(i=[0,1])
    {
        mirror([i,0])
        translate([-hole_pos, 0, 0])
            minkowski()
            {
                $fn=100;
                translate([-5, 0])
                    square([10,-5+(r_from_dia(8)+margin)*2], center=true);
                circle(r = r_from_dia(8)+4+margin, center=true);
            }
     }
    //bolt hole for raspi
    translate([0, 0, 0])
        union()
        {
            for(i=[0,1])
            for(j=[0,1])
            rotate([j*180,i*180,0])
            translate([-58/2, -49/2, 0])
            {
                //circle(r = r_from_dia(17)+margin, center=true);
                rotate([0,0,45])
                translate([-5, 0, 0])
                    square([16,10+margin*2],center=true);
            }
        }
}

$fn=360;
translate([(DOME_DIA+30)/2, -(DOME_DIA+30)/2, 0])
    base_plate_middle_2D();