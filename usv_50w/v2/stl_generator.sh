#!/bin/bash
#bash -x stl_generator.sh

OpenSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

$OpenSCAD -o adapter_100mm.stl adapter_100mm.scad
$OpenSCAD -o adapter_60mm.stl adapter_60mm.scad
$OpenSCAD -o adapter_joint.stl adapter_joint.scad
$OpenSCAD -o inner_100mm.stl inner_100mm.scad
$OpenSCAD -o inner_60mm.stl inner_60mm.scad
$OpenSCAD -o inner_uwv_100mm.stl inner_uwv_100mm.scad