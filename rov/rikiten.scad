include<../params.scad>

$fn=100;
thick=15;
radius=25;
theta=15;

rotate([90,0,0])
difference(){
cylinder(r=radius/2, h=thick, center=true);
    rotate_extrude()
        translate([radius/2,0,0])
        circle(r=thick/2-2);
}
arc_radius=120;
linear_extrude(height=2,center=true)
difference(){
    translate([-arc_radius/2-radius-5-5,0,0])
    minkowski()
    {
        scale([1.6,1])
        arc(arc_radius/2, 0.1, 120);
        circle(r=5,h=1);
    }
    //bolt hole for arm
    translate([-arc_radius/2-radius/2-5,0,0])
    for(i=[0:11])
    {
        translate([(DOME_DIA+20)/2*cos(i*30), (DOME_DIA+20)/2*sin(i*30), 0])
            circle(r = r_from_dia(BASE_PLATE_BOLT), center=true);
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
