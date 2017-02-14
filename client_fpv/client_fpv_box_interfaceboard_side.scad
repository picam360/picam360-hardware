use<camera_hole.scad>

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}

disp_width=121;
disp_height=89.5;
rasp_width=65;
rasp_height=56;

module client_fpv_box_display_side()
{
    difference()
    {
        minkowski_square([disp_width,disp_height]);
        
        //hdmi
        //translate([-disp_width/2+53,-disp_height/2])
        //minkowski_square([18,18*2],r=1);
        
        //raspi con
        translate([-disp_width/2+61,-disp_height/2+58.5])
        minkowski_square([35+2,5+2],r=0.5);
        
        //ext con
        translate([-disp_width/2+61,-disp_height/2+73.5])
        minkowski_square([35+2,5+2],r=0.5);
        
        //usb
        translate([-disp_width/2+0,-disp_height/2+42.5])
        minkowski_square([17*2,34],r=1);
        
        //lan
        translate([-disp_width/2+0,-disp_height/2+18])
        minkowski_square([20*2,20],r=1);
        
        //usb & switch
        //translate([disp_width/2+0,-disp_height/2+64])
        //minkowski_square([8*2,24],r=1);
        
        for(j=[0,1])
        {
            mirror([0,j])
            for(i=[0,1])
            {
                mirror([i,0])
                translate([disp_width/2-3, disp_height/2-3])
                    circle(r=2.5/2);
            }
        }
    }
}

module client_fpv_box_interfaceboard_side()
{
    difference()
    {
        minkowski_square([disp_width,disp_height]);
        
        translate([-disp_width/2+52.5,-disp_height/2+48.5])
        for(j=[0,1])
        {
            mirror([0,j])
            for(i=[0,1])
            {
                mirror([i,0])
                translate([rasp_width/2-3.5, rasp_height/2-3.5])
                    circle(r=2.5/2);
            }
        }
        
        for(j=[0,1])
        {
            mirror([0,j])
            for(i=[0,1])
            {
                mirror([i,0])
                translate([disp_width/2-3, disp_height/2-3])
                    circle(r=2.5/2);
            }
        }
    }
}

$fn=360;
//translate([disp_width/2,-disp_height/2])
//client_fpv_box_display_side();

translate([disp_width/2,-disp_height/2])
client_fpv_box_interfaceboard_side();