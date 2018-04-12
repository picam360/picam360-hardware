#!/bin/bash

OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

targets=(
		arm
		arm_shaft
		dome_bottom
		dome_upper
		lock_spacer
		motor_gear
		motor_mount
		nut
		rotor_pitch_gear
		rotor_pitch
		rotor_spacer
		rotor_yaw_gear
		rotor_yaw
		slipring_filling
		mobility_base_upper
		mobility_base_bottom
	)

for target in "${targets[@]}"; do
	echo ${target}
	$OPENSCAD -o ${target}.stl ${target}.scad
done