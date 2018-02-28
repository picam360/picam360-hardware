include<params.scad>
use<inner_thread.scad>

angle=0;

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
            //translate([0,-radius/2])
            //square([radius*2,radius],center=true);
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
            //translate([0,-radius/2-5/2])
            //square([radius*2,radius+5],center=true);
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
module skrew_mount(angle=0)
{
    dist=CHAMBER_DIA/2+PROP_SHROUD_DIA/2+3;
    difference()
    {
        radius=r_from_dia(PROP_SHROUD_DIA);
        translate([0,dist,0])
        cylinder(r=radius,h=21+3*2,center=true);
        radius2=r_from_dia(PROP_SHROUD_DIA)-PROP_SHROUD_THICK;
        translate([0,dist,0])
        cylinder(r=radius2,h=21.02+3*2,center=true);
        cylinder(r=CHAMBER_DIA/2+0.5,h=100,center=true);
    }
    translate([0,dist,-21/2-3])
    prop_shroud_flange();
    difference()
    {
        union(){
        rotate(45)
        inner_thread(aisle=false,angle=angle);
        joint();
        }
        //translate([0,dist,-100/2-7/2+5])
        //cube([PROP_SHROUD_DIA-PROP_SHROUD_THICK*2,100,100],center=true);
        for(i=[26,30])
        rotate([0,0,i*360/32+45])
        translate([0, DOME_DIA/2+ORING_DIA+CHAMBER_THICK+7/2, 0.01])
        rotate([90,0,0])
        union(){
            translate([0, 0, 10/2])
            cylinder(r=2.7/2,h=10,center=true);
            translate([0, 0, -10/2])
            cylinder(r=4.6/2,h=10,center=true);
        }
        
            for(i=[-1:1])
            rotate([0,0,i*360/32])
translate([0,60,-7])
rotate([0,-90,0])
rotate_extrude(angle=90)
translate([7,0])
circle(r=5/2);
    }
}

module joint(h=7){
    translate([0,0,-h/2])
    linear_extrude(height=h)
    {
        dist=CHAMBER_DIA/2+PROP_SHROUD_DIA/2+3;
        difference()
        {
            translate([0,dist])
            square([80,80],center=true);
            radius=r_from_dia(PROP_SHROUD_DIA);
            translate([0,dist])
            minkowski()
            {
                $fn=100;
                roundess=9;
                difference()
                {
                    square([100,100],center=true);
                    translate([0,-dist])
                    circle(r=CHAMBER_DIA/2+roundess,center=true);
                    translate([0,-PROP_SHROUD_DIA/2])
                    square([radius*2+roundess*2,radius*2+roundess*2],center=true);
                }
                circle(r = roundess, center=true);
            }
            circle(r=CHAMBER_DIA/2,center=true);
            translate([0,dist])
            circle(r=PROP_SHROUD_DIA/2,center=true);
//            square([radius*2-PROP_SHROUD_THICK*2+0.01,radius+10],center=true);
        }
    }
}
$fn=180;
if(false)
{
    intersection(){
    //    rotate([0,0,20])
        skrew_mount(angle=angle);
        translate([0,0,200/2])
    //    translate([0,200/2,0])
        cube([200,200,200], center=true);
    }
}else{
    skrew_mount(angle=angle);
}