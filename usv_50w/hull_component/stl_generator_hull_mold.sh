#!/bin/bash
#bash -x stl_generator.sh bezier_hull_mold_50w.stl 8 8 100

x_max=$2
y_max=$3
grid_size=$4
w=100*$x_max
h=100*$y_max
for ((y=0; y < $y_max; y++)); do
	for ((x=0; x < $x_max; x++)); do
		/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD -o ${1%.*}_y${y}_x${x}.stl -D w=$w -D h=$h -D y=$y -D x=$x -D grid_size=$grid_size -D target=\"$1\" split.scad
	done
done
