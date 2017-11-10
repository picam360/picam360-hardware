include <../lib/MCAD/involute_gears.scad>;

module motor_gear() {
  gear_height=5;
  gear (circular_pitch=270,
    gear_thickness = gear_height,
    rim_thickness = gear_height,
    bore_diameter = 6-0.2,
    hub_thickness = 0,
    hub_diameter = 0,
    circles=0,
    number_of_teeth=8, $fn=100);
  translate([-5/2,2.1,0])
    cube([5,1.2,gear_height]);
}

motor_gear();