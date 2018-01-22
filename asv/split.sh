#!/bin/bash
x_max=$2
y_max=$3
for ((y=0; y < $y_max; y++)); do
	for ((x=0; x < $x_max; x++)); do
/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD -o ${1%.*}_x${x}_y${y}.stl -D x=$x -D y=$y -D target=\"$1\" split.scad
	done
done
