use<camera_holder_for_zero.scad>
use<camera_holder.scad>
use<camera_holder_cover.scad>

translate([39, -0, 0])
rotate([0,0,-90])
camera_holder_2D();
translate([96, -0, 0])
rotate([0,0,-90])
camera_holder_for_zero_2D();

translate([53, -22, 0])
union(){
    translate([-10, -22, 0])
    rotate([0,0,90])
    camera_holder_1_2D();
    translate([-3, -43, 0])
    rotate([0,0,90])
    camera_holder_3_2D();
    translate([-10, -64, 0])
    rotate([0,0,90])
    camera_holder_2_2D();
}