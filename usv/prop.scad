include<../params.scad>

/*Soar Propeller 
Mount to a kv750 outrunner motor
use threaded nose cone to hold motor on the shaft.
Last Edit 3/20/2014
sized to fit in Jim Hertel's rice nozzle
his suggest prop diameter 63mm
*/

module prop(res=100, nBlade=3, hubRad=26.5/2)
{
	//Parameters
	
	propRad=30;  //radius of propeller
    echo(propRad);
	bladeTwist=5; //twist of blade from hub to outerrim, twist is the is the difference of bladeTwist and startAngle, follows left hand rule
	startAngle=22;
	avgAngle=(startAngle+(startAngle-bladeTwist/2))/2; 
	nSlices=20; //20 has been good for printing
	bladeScale=5; //amount of growth of blade moving out from the hub
	bladeThick=2; //thickness of fin, 1mm had been strong enough
	bladeWidth=2; // starting blade width at origin
	//hubHeight=5;// use at least 6 for nose to have threads all the way
	hubHeight=12;//2*(bladeScale)*(bladeWidth)*sin(avgAngle); //uses blades dimensions to find the best hub height. 
	shaftRad=2.5;// 5m bolt on motor
	$fn=res;
	
	/*****************end parameters***********/
	
	difference(){
	
	union(){
	//create the propeller blades
		intersection(){
		for (i=[0:nBlade-1]){
			rotate([0,0,i*360/nBlade])
			rotate([90,90-startAngle,90]) 
			linear_extrude(height=propRad, center=false, convexity=10, twist=bladeTwist, slices=nSlices, scale=[1,bladeScale])
			scale([.8*bladeThick/bladeWidth,1,1]) 
			circle(r = bladeWidth,$fn=res); //blade profile is a scaled circle
			}//end blade loops
	
		translate([0,0,-hubHeight/2])
		cylinder(h=hubHeight, r=propRad, $fn=res);
		}//end intersection - intersection between this cylinder and the blades gives the blades the rounded ends
	
	// create the center hub
	translate([0,0,-hubHeight/2])
	cylinder(h=hubHeight, r=hubRad, $fn=res);
	}//end of union
	
	//remove center hub for shaft
	translate([0,0,-hubHeight/2-.1])
	cylinder(h=hubHeight+.2, r=shaftRad, $fn=res);
	
	}
		
}

prop(res=200);
//end of code