include<../params.scad>

module prop_shroud_flange(margin=1, atachement=[2,3,4,6])
{
    linear_extrude(height = 3, twist = 0, slices = 0)
    {
        prop_shroud_flange_2D(margin=margin, atachement=atachement);
    }
}
module prop_shroud_flange_2D(margin=1, atachement=[2,3,4,6], minkowski_fn=100)
{
    roundess=3;
    difference()
    {
        circle(r = r_from_dia(PROP_SHROUD_DIA)+margin);
   		circle(r=r_from_dia(5));
        minkowski()
        {
    	    $fn=minkowski_fn;
            prop_shroud_flange_inner_2D(margin=roundess, atachement=atachement);
            circle(r = roundess, center=true);
        }
        for(i=[0,1,2,3])
        {
            rotate(90*i+45)
                translate([0,r_from_dia(12)])
                    circle(r=r_from_dia(2.1));
            rotate(90*i+45)
                translate([0,r_from_dia(16)])
                    circle(r=r_from_dia(2.1));
            rotate(90*i+45)
                translate([0,r_from_dia((16+12)/2)])
                    square([2.1,2], center=true);
        }
    }
}
module prop_shroud_flange_inner_2D(margin=0, atachement=[2,3,4,6])
{
    difference()
    {
        circle(r=r_from_dia(PROP_SHROUD_DIA)-PROP_SHROUD_THICK-margin);
        //motor bed
        circle(r=r_from_dia(24)+margin);
        //support
        support_width = 5+margin*2;
        for(i=atachement)
        {
            rotate(60*i)
            {
                translate([0,PROP_SHROUD_DIA/4])
                    square([support_width,PROP_SHROUD_DIA/2], center=true);
            }
        }
    }
}

$fn=360;
prop_shroud_flange_2D(margin=0);

