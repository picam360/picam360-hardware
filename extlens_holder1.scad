
module spacer(r1, r2){
    difference()
    {
        circle(r=r1);
        circle(r=r2);
        translate([0,7])
        square([14,14], center=true);
    }
}

$fn=1000;
translate([21.0/2,-21.0/2])
    spacer(21.0/2, 15.0/2);