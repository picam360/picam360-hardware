use<oring.scad>

module pod(tube_dia=60, h=160, camera=false, margin=0){
        
    translate([0,0,h])
    union(){
        translate([0,0,-10+1])
        import(str("cover_",tube_dia,"mm.stl"));
    }
    
    translate([0,0,h-5.5-margin])
    union(){
        if(camera){
            color([0.5,0.5,0.5,0.5])
            translate([0,0,2+0.75])
            difference(){
                sphere(r=46/2);
                sphere(r=46/2-2);
                translate([0,0,-100/2])
                cube([100,100,100],center=true);
            }
        }else{
            translate([0,0,0.75])
            import(str("base_seal_",tube_dia,"mm_outer.stl"));
        }

        if(tube_dia==60){
            oring(outer_dia=56.7+0.3, inner_dia=49.7+0.3);
        }else if(tube_dia==100){
            oring(outer_dia=96.0+0.8, inner_dia=84.6+0.8);
        }

        translate([0,0,-0.75])
        rotate([180,0,0])
        import(str("base_seal_",tube_dia,"mm_inner.stl"));
    }
    
    translate([0,0,5.5+margin])
    union(){
        translate([0,0,0.75])
        import(str("base_seal_",tube_dia,"mm_inner.stl"));

        if(tube_dia==60){
            oring(outer_dia=56.7+0.3, inner_dia=49.7+0.3);
        }else if(tube_dia==100){
            oring(outer_dia=96.0+0.8, inner_dia=84.6+0.8);
        }

        translate([0,0,-0.75])
        rotate([180,0,0])
        import(str("base_seal_",tube_dia,"mm_outer.stl"));
    }
        
    union(){
        translate([0,0,10-1])
        rotate([180,0,0])
        import(str("cover_",tube_dia,"mm.stl"));
    }
    
    color([0.5,0.5,0.5,0.5])
    difference(){
        cylinder(r=tube_dia/2, h=h);
        translate([0,0,-0.01])
        cylinder(r=tube_dia/2-2, h=h+.02);
    }
}
pod(tube_dia=60,h=40,camera=true,margin=1);