
module extlens_holder3(r1, r2){
    difference()
    {
        circle(r=r1);
        circle(r=r2);
    }
}

$fn=1000;
translate([21.0/2,-21.0/2])
    extlens_holder3(21.0/2, 14.1/2);