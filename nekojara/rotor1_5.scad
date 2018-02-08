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
    for(i=[0:1])
    {
        mirror([i,0,0])
        translate([3.5/2+9/2,0,(height+1.6)/2])
        cube([3.5-0.2,2-0.2,height+1.6], center=true);
    }
}
rotor1_4();
