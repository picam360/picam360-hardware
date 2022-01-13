#!/bin/bash
#bash -x stl_generator.sh

OpenSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

$OpenSCAD -o bezier_hull_50w.stl bezier_hull_50w.scad
$OpenSCAD -o hull_base.stl hull_base.scad