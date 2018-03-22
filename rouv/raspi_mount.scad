include<params.scad>
use<../lib/arc.scad>

thick=1.5;
dia_margin=0.2;
module raspi_mount(offset=0)
{
    aisle=3;
    h=11-SHELL_THICK*2;
    h1=1.4;
    h2=0.6;
    difference()
    {
        union()
        {
            difference()
            {
                cylinder(r=r_from_dia(DOME_DIA)-DOME_THICK-1-dia_margin,h=h,center=true);
                cylinder(r=r_from_dia(DOME_DIA)-DOME_THICK-1-thick-dia_margin,h=100,center=true);
            }
            translate([0, 0, h/2-h1/2])
            base_plate_middle(height=h1);
            translate([0, 0, h/2-h1-h2/2])
            base_plate_middle(height=h1,raspi_hole=6.2);
        }
                
        for(i=[0:7])
        rotate([90,0,i*45+22.5])
        translate([0,0,(DOME_DIA)/2-3])
        cylinder(r=2.5/2, h=10, center=true);
        
        for(i=[0:7])
        rotate([90,0,i*45+22.5])
        translate([0,0,(DOME_DIA)/2-3-dia_margin-1-10/2])
        cylinder(r=4/2, h=10, center=true);
        
        for(a=[0:3])
        {
            for(i=[0,1,3,4,5,7])
            if(a==0&&i==1){
                rotate([90,0,i*360/32+a*90])
                translate([0,0,(DOME_DIA)/2-3])
                cylinder(r = 4/2, h=10, center=true);
            }else{
                translate([0,0,-10/2+aisle/2])
                rotate([90,0,i*360/32+a*90])
                translate([0,0,(DOME_DIA)/2-3])
                minkowski()
                {
                    _fn=$fn;
                    $fn=100;
                    cube([0.01,10-aisle,0.1],center=true);
                    cylinder(r = aisle/2, h=10, center=true);
                }
            }
        }
    }
}
module base_plate_middle(height = BASE_PLATE_BOLT, raspi_base=true, raspi_hole=BASE_PLATE_BOLT, hole=BASE_PLATE_BOLT)
{
    linear_extrude(height = height, twist = 0, slices = 0, center=true)
    {
        base_plate_middle_2D(raspi_base=raspi_base, raspi_hole=raspi_hole, hole=hole);
    }
}
module base_plate_middle_2D(raspi_hole=BASE_PLATE_BOLT, hole=BASE_PLATE_BOLT)
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
                    circle(r = r_from_dia(DOME_DIA)-3-dia_margin);
                minkowski()
                {
                    _fn=$fn;
                    $fn=100;
                    difference()
                    {
                        circle(r = r_from_dia(DOME_DIA+16-3));
                        base_plate_inner_2D(margin=roundess, raspi_base=true, $fn=_fn);
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
                    circle(r = 4, center=true);
                }
            }
        }
        //bolt hole for raspi
        for(i=[0,1])
            mirror([0,i]) for(j=[0,1])
                mirror([j,0]) translate([-58/2, -49/2, 0])
                    rotate([0,0,30])
                    circle(r = r_from_dia(raspi_hole), center=true, $fn=raspi_hole>4?6:100);
        //rpcm board
        square([51,60], center=true);
    }
}
module base_plate_inner_2D(margin=1.5, raspi_base=true, aisle=false)
{
    hole_pos = r_from_dia(DOME_DIA)-DOME_THICK-r_from_dia(8)-0;
    difference()
    {
        translate([0, 0, 0])
            circle(r = r_from_dia(DOME_DIA+16));
        translate([0, 0, 0])
            circle(r = r_from_dia(DOME_DIA)-DOME_THICK-1-thick+0.01-dia_margin-margin);
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
                    square([16,8+margin*2],center=true);
            }
        }
}

$fn=360;
if(false){
    difference()
    {
        //rpcm board
        w=56;
        h=65;
        square([w,h], center=true);
        for(x=[-(w/2-3.5),w/2-3.5])
        for(y=[-(h/2-3.5),h/2-3.5])
        translate([x, y])
        cylinder(r=3/2,h=100,center=true);
    }
    raspi_mount(height=11, raspi_hole=2.7);
}else{
    raspi_mount(height=11, raspi_hole=2.7);
}
//raspi_mount_2D(raspi_hole=0);
////raspi_mount_inner_2D(margin=3);