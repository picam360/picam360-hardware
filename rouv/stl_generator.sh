#!/bin/bash

OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

for ((angle=0; angle < 360; angle+=90)); do
	$OPENSCAD -o skrew_mount_${angle}.stl -D angle=$angle skrew_mount.scad
done

$OPENSCAD -o main_chamber.stl main_chamber.scad
$OPENSCAD -o oring_holder.stl oring_holder.scad
$OPENSCAD -o chamber_bottom.stl chamber_bottom.scad
