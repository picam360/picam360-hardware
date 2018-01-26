include<../params.scad>
use<prop_shroud_flange.scad>

module arm(height = 3, margin = 1, minkowski_fn=100)
{
    linear_extrude(height = height, twist = 0, slices = 0)
    {
        arm_2D(margin=margin, minkowski_fn=minkowski_fn);
    }
}
module arm_2D(margin=1, minkowski_fn=100)
{
	//prop_shroud_flange_2D(margin=margin, minkowski_fn=minkowski_fn);
	translate([0,-PROP_SHROUD_DIA/2])
	difference()
	{
	    union()
	    {
		   	//base plate joint
	        translate([0,PROP_SHROUD_DIA/2])
            difference()
            {
                translate([0,-20])
                    square([80,40],center=true);
                minkowski()
                {
                    $fn=100;
                    roundess=15;
                    difference()
                    {
                        translate([0,-PROP_SHROUD_DIA/2])
                            square([100,100],center=true);
                        union()
                        {
                            circle(r=r_from_dia(PROP_SHROUD_DIA)+margin+roundess-10);
                            translate([0,-PROP_SHROUD_DIA/2])
                            translate([0,-(DOME_DIA+30)/2+7.5])
                                circle(r=r_from_dia(DOME_DIA+30)+roundess);
                        }
                    }
                    circle(r = roundess, center=true);
                }
		    	//circle(r=r_from_dia(PROP_SHROUD_DIA)+margin-.01);
                translate([0,-PROP_SHROUD_DIA/2])
	            translate([0,-(DOME_DIA+30)/2+7.5])
	        	translate([0,-ORING_DIA])
		    		circle(r=r_from_dia(DOME_DIA)+ORING_DIA);
            }

	        translate([0,-(DOME_DIA+30)/2+7.5])
		    intersection()
		    {
			    polygon(points=[[0,0],[-100,100],[100,100]],paths=[[0,1,2]]);
		    	difference()
		    	{
			    	circle(r=r_from_dia(DOME_DIA+30));
	        		translate([0,-ORING_DIA])
		    		circle(r=r_from_dia(DOME_DIA)+ORING_DIA);
	        		translate([0,(DOME_DIA+30)/2-5+PROP_SHROUD_DIA/2])
		    			circle(r=r_from_dia(PROP_SHROUD_DIA));
			    }
		    }
		}
		bolt_size = 2.6;
	   	translate([0,-(DOME_DIA+30)/2+7.5])
	    for(i=[1,2,3,4])
	    {
	        translate([(DOME_DIA+20)/2*cos(i*30+15), (DOME_DIA+20)/2*sin(i*30+15), 0])
		        circle(r = r_from_dia(bolt_size+0.2), center=true, $fn = 100);
	    }
	   	translate([0,-(DOME_DIA+30)/2+7.5])
	    for(i=[2,3])
	    {
	        translate([(DOME_DIA+20)/2*cos(i*30+15), (DOME_DIA+20)/2*sin(i*30+15)-5, 0])
		        circle(r = r_from_dia(bolt_size+0.2), center=true, $fn = 100);
	        translate([(DOME_DIA+20)/2*cos(i*30+15), (DOME_DIA+20)/2*sin(i*30+15)-3, 0])
		        circle(r = r_from_dia(bolt_size+0.2), center=true, $fn = 100);
	        translate([(DOME_DIA+20)/2*cos(i*30+15), (DOME_DIA+20)/2*sin(i*30+15)-1.5, 0])
		        square([bolt_size+0.2,3], center=true);
	        translate([(DOME_DIA+20)/2*cos(i*30+15), (DOME_DIA+20)/2*sin(i*30+15)-4, 0])
		        square([bolt_size+0.2,2], center=true);
	    }
	}
}

$fn = 360;
arm(height=5, margin=1, minkowski_fn=200);