
module spacer(r1, r2){
    difference()
    {
        circle(r=r1);
        circle(r=r2);
        translate([0,(r1*2+1)/2])
        square([r1*2+1,r1*2+1], center=true);
    }
}

$fn=1000;
translate([21.0/2,-21.0/2])
    spacer(21.0/2, 16.2/2);