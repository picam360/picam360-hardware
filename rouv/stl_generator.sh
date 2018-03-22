#!/bin/bash

OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

for ((angle=0; angle < 360; angle+=90)); do
	$OPENSCAD -o inner_thread_${angle}.stl -D angle=$angle -D angle2=60 inner_thread.scad
done

for ((angle=45; angle < 360; angle+=90)); do
	$OPENSCAD -o inner_thread_${angle}.stl -D angle=$angle -D angle2=30 inner_thread.scad
done

for ((angle=0; angle < 360; angle+=90)); do
	$OPENSCAD -o skrew_mount_${angle}.stl -D angle=$angle -D angle2=60 skrew_mount.scad
done

$OPENSCAD -o fill_jig_0.0.stl -D aisle=0 fill_jig.scad
$OPENSCAD -o fill_jig_2.0.stl -D aisle=2 fill_jig.scad
$OPENSCAD -o fill_jig_2.5.stl -D aisle=2.5 fill_jig.scad

$OPENSCAD -o filling_0.5.stl -D aisle=0.5 filling.scad
$OPENSCAD -o filling_2.0.stl -D aisle=2 filling.scad
$OPENSCAD -o filling_2.5.stl -D aisle=2.5 filling.scad

$OPENSCAD -o main_chamber.stl main_chamber.scad
$OPENSCAD -o oring_base.stl oring_base.scad
$OPENSCAD -o oring_holder.stl oring_holder.scad
$OPENSCAD -o chamber_bottom.stl chamber_bottom.scad
