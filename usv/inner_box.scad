include <../lib/finger_joint-3.3.scad>
use <bezier_hull.scad>;

addLid=0; //[1:Lid, 0:No Lid]

//Box Width - X
bX=310;
//Box Depth - Y
bY=920;
//Box Height - Z
bZ=70;
//Material Thickness
thick=30;

fingerW=35;

$fn=360;

module  minkowski_square(dimension, r=2)
{
    minkowski()
    {
        square([dimension.x-r*2,dimension.y-r*2], center=true);
        circle(r=r);
    }
}
module box1_floor(){
    //Calculate the maximum number of fingers and cuts possible
    maxDivX=floor(bX/fingerW);
    maxDivY=floor(bY/fingerW);
    maxDivZ=floor(bZ/fingerW);

    //Calculate the max number of fingers and cuts for the lid
    maxDivLX=floor(bX/fingerLidW);
    maxDivLY=floor(bY/fingerLidW);

    //the usable divisions value must be odd for this layout
    uDivX= (maxDivX%2)==0 ? maxDivX-3 : maxDivX-2;
    uDivY= (maxDivY%2)==0 ? maxDivY-3 : maxDivY-2;
    uDivZ= (maxDivZ%2)==0 ? maxDivZ-3 : maxDivZ-2;
    uDivLX= (maxDivLX%2)==0 ? maxDivLX-3 : maxDivLX-2;
    uDivLY= (maxDivLY%2)==0 ? maxDivLY-3 : maxDivLY-2;
        
    difference(){
        faceB(uDivX, uDivY, uDivZ, uDivLX, uDivLY, makeLid=0);
        
        //stater
        translate([0,860/2-50])
        minkowski_square([10.01,70], r=10/2);
        
        //shaft holder
        translate([0,860/2-300])
        minkowski_square([10.01,150], r=0.01);
        
        //arduino base
        translate([0,-860/2+220])
        minkowski_square([8.01,68], r=8/2);
        
        //ladder
        translate([0,-860/2+25])
        circle(r=9/2+0.2);
    }
}
module box2_floor(){
    //Calculate the maximum number of fingers and cuts possible
    maxDivX=floor(bX/fingerW);
    maxDivY=floor(bY/fingerW);
    maxDivZ=floor(bZ/fingerW);

    //Calculate the max number of fingers and cuts for the lid
    maxDivLX=floor(bX/fingerLidW);
    maxDivLY=floor(bY/fingerLidW);

    //the usable divisions value must be odd for this layout
    uDivX= (maxDivX%2)==0 ? maxDivX-3 : maxDivX-2;
    uDivY= (maxDivY%2)==0 ? maxDivY-3 : maxDivY-2;
    uDivZ= (maxDivZ%2)==0 ? maxDivZ-3 : maxDivZ-2;
    uDivLX= (maxDivLX%2)==0 ? maxDivLX-3 : maxDivLX-2;
    uDivLY= (maxDivLY%2)==0 ? maxDivLY-3 : maxDivLY-2;
        
    faceA(uDivX, uDivY, uDivZ, uDivLX, uDivLY, makeLid=0);
}
module box3_floor(){
    //Calculate the maximum number of fingers and cuts possible
    maxDivX=floor(bX/fingerW);
    maxDivY=floor(bY/fingerW);
    maxDivZ=floor(bZ/fingerW);

    //Calculate the max number of fingers and cuts for the lid
    maxDivLX=floor(bX/fingerLidW);
    maxDivLY=floor(bY/fingerLidW);

    //the usable divisions value must be odd for this layout
    uDivX= (maxDivX%2)==0 ? maxDivX-3 : maxDivX-2;
    uDivY= (maxDivY%2)==0 ? maxDivY-3 : maxDivY-2;
    uDivZ= (maxDivZ%2)==0 ? maxDivZ-3 : maxDivZ-2;
    uDivLX= (maxDivLX%2)==0 ? maxDivLX-3 : maxDivLX-2;
    uDivLY= (maxDivLY%2)==0 ? maxDivLY-3 : maxDivLY-2;
        
    faceC(uDivX, uDivY, uDivZ, uDivLX, uDivLY, makeLid=0);
}
module box_ceil(){
    difference(){
        square([bX,bY/2],center=true);
        translate([0,-15/2,0])
        square([bX-30,bY/2-15-0.1],center=true);
    }
}
module hull_floor(){
    resolution = 100;    
    $fn = resolution;

    height=100;
    ratio=15;
    stepz = 44;
    step = 102;
    w1 = 0.9;
    w2 = 0.8;
        
    view_refpoints = false;
        
    refpoints = [
        [
            [0,50,height/ratio],
            [0,50*w1,0.2*height/ratio],
            [0,50*w2,0]
        ],
        [
            [-36,36,height/ratio],
            [-36*w1,36*w1,0.2*height/ratio],
            [-36*w2,36*w2,0]
        ],
        [
            [-22,-25,height/ratio],
            [-22*w1,-25*w1,0.2*height/ratio],
            [-22*w2,-25*w2,0]
        ],
        [
            [-19,-50,height/ratio],
            [-19*w1,-50*0.98,0.2*height/ratio],
            [-19*w2,-50*0.95,0]
        ],
    ];
    //difference()
    {
        bezier_hull(scale_points(refpoints,ratio*[1,1,1]),stepz=stepz,step=step,slice_z=stepz);
        
//        //stater
//        translate([0,-680+810])
//        minkowski_square([10.01,70], r=10/2);
//        
//        //shaft holder
//        translate([0,-680+560])
//        minkowski_square([10.01,150], r=0.01);
//        
//        //arduino base
//        translate([0,-680+220])
//        minkowski_square([8.01,68], r=8/2);
//        
//        //ladder
//        translate([0,-680+25])
//        circle(r=9/2+0.2);
    }
}

type=4;
if(type==0){
    translate([1,-310/2-1,0])
    rotate(90)
    intersection(){
        box1_floor();
        translate([0,-1000/2,0])
        square([1000,1000],center=true);
    }
}
if(type==1){
    translate([920/2+1,-310/2-1,0])
    rotate(90)
    intersection(){
        box1_floor();
        translate([0,1000/2,0])
        square([1000,1000],center=true);
    }
}
if(type==2){
    translate([310/2+1,-70/2-1,0])
        box2_floor();
    
    translate([310/2+1,-110,0])
        box2_floor();
    
    translate([920/2,-185,0])
    intersection(){
        box3_floor();
        translate([-1000/2-920/2/3,0,0])
        square([1000,1000],center=true);
    }
    translate([920/2,-260,0])
    intersection(){
        box3_floor();
        translate([-1000/2-920/2/3,0,0])
        square([1000,1000],center=true);
    }
    translate([920/2-920/3+1,-335,0])
    intersection(){
        box3_floor();
        square([920/3,1000],center=true);
    }
    
    translate([350,150,0])
    rotate(90)
    intersection(){
        box3_floor();
        translate([-1000/2-920/2/3,0,0])
        square([1000,1000],center=true);
    }
    translate([425,150,0])
    rotate(90)
    intersection(){
        box3_floor();
        translate([-1000/2-920/2/3,0,0])
        square([1000,1000],center=true);
    }
    translate([500,-160,0])
    rotate(90)
    intersection(){
        box3_floor();
        square([920/3,1000],center=true);
    }
}
if(type==3){
    translate([bY/4+1,-bX/2-1,0])
    rotate(90)
    box_ceil();
}
if(type==4){
    lmargin=2;
    margin=3;
    type2=10;
    if(type2==0){
        intersection(){
            hull_floor();
            translate([0,375])
            rotate(90)
            square([450,550],center=true);
        }
    }else if(type2==1){
        intersection(){
            bezier_hull(scale_points(refpoints,ratio*[1,1,1]),stepz=stepz,step=step,slice_z=stepz);
            translate([450/2,-550/2+150])
            square([450,550],center=true);
        }
    }else if(type2==2){
        intersection(){
            bezier_hull(scale_points(refpoints,ratio*[1,1,1]),stepz=stepz,step=step,slice_z=stepz);
            translate([0,-550+150-450/2])
            rotate(90)
            square([450,550],center=true);
        }
    }else if(type2==3){
        translate([550/2,-600])
        intersection(){
            difference(){
                hull_floor();
                translate([0,-150])
                square([380,940],center=true);
            }
            translate([0,-300/2+600])
            square([550,300],center=true);
        }
        translate([550/2,295])
        intersection(){
            difference(){
                hull_floor();
                translate([0,-150])
                square([380,940],center=true);
            }
            translate([0,-720+120/2])
            square([550,120],center=true);
        }
    }else if(type2==4){
        for(i=[0:1]){
            translate([(520+lmargin)/2,-(100+lmargin)/2-i*(100+lmargin+margin)])
            square([520+lmargin,100+lmargin],center=true);
        }
        for(i=[0:1]){
            translate([(520+lmargin)/2,-2*(100+lmargin+margin)-(50+lmargin)/2-i*(50+lmargin+margin)])
            square([520+lmargin,50+lmargin],center=true);
        }
    }else if(type2==5){
        color("red")
        for(i=[0:1]){
            translate([480/2+lmargin/2+20,-50/2-lmargin/2-i*(100+lmargin+margin)-20])
            square([480,50],center=true);
        }
    }else if(type2==6){
        for(i=[0:1]){
            translate([(380+lmargin)/2,-(100+lmargin)/2-i*(100+lmargin+margin)])
            square([380+lmargin,100+lmargin],center=true);
        }
        for(i=[0:1]){
            translate([(340+lmargin)/2,-2*(100+lmargin+margin)-(50+lmargin)/2-i*(50+lmargin+margin)])
            square([340+lmargin,50+lmargin],center=true);
        }
    }else if(type2==7){
        color("red")
        for(i=[0:1]){
            translate([340/2+lmargin/2+20,-50/2-lmargin/2-i*(100+margin)-20])
            square([340,50],center=true);
        }
    }else if(type2==8){
        translate([260/2,-260/2])
        square([260,260],center=true);
    }else if(type2==9){
        difference(){
        translate([260/2,-260/2])
        square([260,260],center=true);
        translate([260/2,-260/2])
        circle(r=100/2,center=true);
        }
    }else if(type2==10){
        translate([(260+lmargin)/2,-(260+lmargin)/2])
        difference(){
            square([260+lmargin,260+lmargin],center=true);
            minkowski_square([260-lmargin-30*2,260-lmargin-30*2],r=10);
        }
    }else{
        hull_floor();
    }
}