include<../params.scad>

module relay_box_bottom()
{
    shell=2;
    space_x=3;
    space_y=5;
    raspi_width=85;
    raspi_height=56;
    raspi_hole_width=65-7;
    raspi_hole_height=56-7;
    offset_x=0;
    offset_y=2;
    r=shell;
    difference()
    {
        union()
        {
            difference()
            {
                union()
                {
                    minkowski()
                    {
                        $fn=100;
                        cube([raspi_width-r*2+(shell+space_x)*2,raspi_height-r*2+(shell+space_y)*2,0.01], center=true);
                        sphere(r = r, center=true);
                    }
                    translate([0,0,-32/2])
                    linear_extrude(height=32,center=true)
                    minkowski()
                    {
                        square([raspi_width-r*2+(shell+space_x)*2,raspi_height-r*2+(shell+space_y)*2], center=true);
                        circle(r = r, center=true);
                    }
                }
                translate([0,0,-100/2])
                linear_extrude(height=100,center=true)
                minkowski()
                {
                    square([raspi_width-r*2+(space_x)*2,raspi_height-r*2+(space_y)*2], center=true);
                    circle(r = r, center=true);
                }
                translate([0,0,-10/2-30])
                linear_extrude(height=10,center=true)
                minkowski()
                {
                    square([raspi_width-r*2+(shell/2+space_x)*2+0.1,raspi_height-r*2+(shell/2+space_y)*2+0.1], center=true);
                    circle(r = r, center=true);
                }
            }
            translate([0,-offset_y,0])
            translate([(raspi_width-raspi_hole_width-(raspi_height-raspi_hole_height))/2,0,0])
            for(i=[0,1])
            mirror([i,0])
            for(j=[0,1])
            mirror([0,j])
            translate([raspi_hole_width/2,raspi_hole_height/2,-2/2+0.01])
            cylinder(r=8.5/2,h=2,center=true);
        }
        translate([0,-offset_y,0])
        union(){
            translate([(raspi_width-raspi_hole_width-(raspi_height-raspi_hole_height))/2,0,0])
            for(i=[0,1])
            mirror([i,0])
            for(j=[0,1])
            mirror([0,j])
            translate([raspi_hole_width/2,raspi_hole_height/2,0])
            union()
            {
                translate([0,0,100/2])
                cylinder(r=5/2,h=100,center=true);
                cylinder(r=2.7/2,h=100,center=true);
            }
            translate([-100/2,0,-100/2-12])
            cube([100,53,100],center=true);
            
            translate([100/2,-17,-12/2-2-1.6])
            cube([100,10,12],center=true);
            
            translate([(raspi_width-raspi_hole_width-(raspi_height-raspi_hole_height))/2,0,0])
            translate([raspi_hole_width/2,100/2,-13])
            rotate([90,0,0])
            cylinder(r=6/2,h=100,center=true);
            
            translate([0,100/2,-13])
            rotate([90,0,0])
            cylinder(r=6/2,h=100,center=true);
        }
        
        translate([0,0,shell-0.5/2+0.01])
        linear_extrude(height=0.5,center=true)
        text("Picam360", size=15, halign="center", valign="center", font = "Liberation Sans");
    }
}

$fn=180;
//projection(cut=true)
relay_box_bottom();
