use<ROVProp.scad>

module ROVPropAdapter(res=100)
{
    $fn = res;
    inner_r = 23.5;
    outer_r = 26.5;
    difference()
    {
        union()
        {
			import("ROVProp.stl");
//            difference()
//            {
////                union()
////                {
//                    translate([0,0,3])
//                    ROVProp(res, nBlade=2, hubRad=outer_r/2);
//                    //translate([0,0,+1.5+9/2])
//                    //    cylinder(r=outer_r/2, h=3.01, center=true);
////                }
//                translate([0,0,-50-9/2+2])
//                    cylinder(r=outer_r+.01/2, h=100, center=true);
//                translate([0,0,0])
//                    cylinder(r=inner_r/2, h=100, center=true);
//                translate([0,0,50+8.7])
//                    cylinder(r=outer_r+.01/2, h=100, center=true);
//            }
            difference()
            {
			    import("ROVPropAdapter_flange.stl");
//                slit = 16;
//                corner = 2;
//                for(i=[0,1,2,3])
//                {
//                    translate([slit*cos(i*90+45), slit*sin(i*90+45), 0])
//                    rotate([0,0,90*i])
//                    difference()
//                    {
//                        cube([slit,slit,100], center=true);
//                        translate([-slit/2-.01,-slit/2-.01])
//                        difference()
//                        {
//                            translate([corner,corner])
//                                cube([corner*2,corner*2,101], center=true);
//                            translate([corner*2,corner*2])
//                                cylinder(r=corner*2, h=102, center=true);
//                        }
//                    }
//                }
            }
        }
//        translate([0,0,9/2+3-.01])
//            cylinder(r1=inner_r/2, r2=12.5/2, h=2.5+.01);
//        for(i=[0,1,2,3])
//        {
//	        translate([9/2*cos(i*90), 9/2*sin(i*90), 0])
//                cylinder(r=2/2, h=100, center=true);
//        }
//        cylinder(r=2/2, h=100, center=true);
        
////        translate([0,-50,0])
////            cube([100,100,100], center=true);
    }
}

ROVPropAdapter(res=200);