$fn=100;

module rotor1_4() {
    margin = 0.3;
    thread_diameter = 12 + margin;
    height = 1;
    difference() {
        translate([0, 0, height/2])
        cylinder(r=17/2,h=height,center=true);
        cylinder(r=thread_diameter/2,h=100,center=true);
    }
    intersection(){
        for(i=[0:1])
        {
            mirror([i,0,0])
            translate([(2-0.2)/2+9/2,0,(height+1)/2])
            cube([2-0.2,2-0.2,height+1], center=true);
        }
        cylinder(r=thread_diameter/2,h=100,center=true);
    }
}
rotor1_4();
