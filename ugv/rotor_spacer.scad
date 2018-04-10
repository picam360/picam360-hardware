$fn=100;

module rotor1_4() {
    margin = 0.3;
    thread_diameter = 15 + margin;
    height = 1;
    difference() {
        translate([0, 0, height/2])
        cylinder(r=thread_diameter/2+2,h=height,center=true);
        cylinder(r=thread_diameter/2,h=100,center=true);
    }
}
rotor1_4();
