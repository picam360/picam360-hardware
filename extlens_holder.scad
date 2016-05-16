use<extlens_holder1.scad>
use<extlens_holder2.scad>
use<extlens_holder3.scad>

$fn=1000;
translate([21.0/2,-21.0/2])
    extlens_holder1(21.0/2, 15.0/2);
translate([21.0/2 + 22.0,-21.0/2])
    extlens_holder2(21.0/2, 16.2/2);
translate([21.0/2 + 22.0*2,-21.0/2])
    extlens_holder3(21.0/2, 14.1/2);