#!/bin/bash

OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

for ((angle=45; angle < 360; angle+=90)); do
	$OPENSCAD -o inner_thread_${angle}.stl -D angle=$angle -D angle2=30 inner_thread.scad
done

for ((angle=0; angle < 360; angle+=90)); do
	$OPENSCAD -o inner_thread_${angle}.stl -D angle=$angle inner_thread.scad
done

for ((angle=0; angle < 360; angle+=90)); do
	$OPENSCAD -o skrew_mount_${angle}.stl -D angle=$angle skrew_mount.scad
done

for ((type=0; type < 2; type++)); do
	$OPENSCAD -o aisle_mold_${type}.stl -D type=$type aisle_mold.scad
done

$OPENSCAD -o main_chamber.stl main_chamber.scad
$OPENSCAD -o oring_base.stl oring_base.scad
$OPENSCAD -o oring_holder.stl oring_holder.scad
$OPENSCAD -o chamber_bottom.stl chamber_bottom.scad
