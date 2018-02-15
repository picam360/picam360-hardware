include<../params.scad>
use<inner_thread.scad>

module prop_shroud_flange(margin=0, atachement=[2,4,6])
{
    linear_extrude(height = PROP_SHROUD_THICK, twist = 0, slices = 0)
    {
        prop_shroud_flange_2D(margin=margin, atachement=atachement);
    }
}
module prop_shroud_flange_2D(margin=0, atachement=[2,4,6], minkowski_fn=100)
{
    roundess=3;
    difference()
    {
        radius=r_from_dia(PROP_SHROUD_DIA)-PROP_SHROUD_THICK+0.01;
        union(){
            circle(r = radius);
            translate([0,-radius/2])
            square([radius*2,radius],center=true);
        }
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
module prop_shroud_flange_inner_2D(margin=0, atachement=[2,4,6])
{
    difference()
    {
        radius=r_from_dia(PROP_SHROUD_DIA)-PROP_SHROUD_THICK-margin+0.01;
        union(){
            circle(r=radius);
            translate([0,-radius/2-5/2])
            square([radius*2,radius+5],center=true);
        }
        //motor bed
        circle(r=r_from_dia(24)+margin);
        //support
        support_width = 5+margin*2;
        for(i=atachement)
        {
            rotate(60*i)
            {
                translate([0,100/2])
                    square([support_width,100], center=true);
            }
        }
    }
}
module skrew_mount()
{
    dist=DOME_DIA/2+15+PROP_SHROUD_DIA/2;
    difference()
    {
        radius=r_from_dia(PROP_SHROUD_DIA);
        translate([0,dist,0])
        union(){
            cylinder(r=radius,h=21,center=true);
            translate([0,-radius/2-5/2])
            cube([radius*2,radius+5,21],center=true);
        }
        radius2=r_from_dia(PROP_SHROUD_DIA)-PROP_SHROUD_THICK;
        translate([0,dist,0])
        union(){
            cylinder(r=radius2,h=21.02,center=true);
            translate([0,-radius2/2-15/2])
            cube([radius2*2,radius2+15,21.02],center=true);
        }
        cylinder(r=DOME_DIA/2+15+0.5,h=100,center=true);
    }
    translate([0,dist,0])
    union(){
        translate([0,0,-21/2])
        prop_shroud_flange();
        for(i=[0,1])
        mirror([i,0,0])
        joint();
    }
    rotate(45)
    inner_thread();
}
module joint(h=7){
    translate([0,0,-h/2])
    linear_extrude(height=h)
    {
        difference()
        {
            translate([PROP_SHROUD_DIA/2+0.5,-PROP_SHROUD_DIA/2-3.7])
            square([11,10],center=true);
            dist=DOME_DIA/2+15+PROP_SHROUD_DIA/2;
            radius=r_from_dia(PROP_SHROUD_DIA);
            minkowski()
            {
                $fn=100;
                roundess=9;
                difference()
                {
                    translate([PROP_SHROUD_DIA/2,-PROP_SHROUD_DIA/2])
                    square([20,20],center=true);
                    translate([0,-dist])
                    circle(r=DOME_DIA/2+15+roundess,center=true);
                    translate([0,-radius/2-10/2])
                    square([radius*2+roundess*2,radius+10],center=true);
                }
                circle(r = roundess, center=true);
            }
            translate([0,-dist])
            circle(r=DOME_DIA/2+15,center=true);
            translate([0,-radius/2-10/2])
            square([radius*2-PROP_SHROUD_THICK*2+0.01,radius+10],center=true);
        }
    }
}
$fn=100;
skrew_mount();