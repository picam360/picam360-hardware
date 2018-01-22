#!/bin/bash
y_max=$2
x_max=$3
for ((y=0; y < $y_max; y++)); do
	for ((x=0; x < $x_max; x++)); do
		/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD -o ${1%.*}_y${y}_x${x}.stl -D y=$y -D x=$x -D target=\"$1\" split.scad
	done
done
