use<extlens_holder1.scad>
use<extlens_holder2.scad>
use<extlens_holder3.scad>

$fn=1000;
translate([25.0/2,-25.0/2])
    extlens_holder3(25.0/2, 19.2/2);
translate([25.0/2 + 27.0,-25.0/2])
    extlens_holder3(25.0/2, 13.8/2);