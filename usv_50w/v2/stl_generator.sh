#!/bin/bash
#bash -x stl_generator.sh

OpenSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

$OpenSCAD -o adapter_100mm.stl adapter_100mm.scad
$OpenSCAD -o adapter_80mm.stl adapter_80mm.scad
$OpenSCAD -o adapter_80mm_holder.stl adapter_80mm_holder.scad
$OpenSCAD -o adapter_joint.stl adapter_joint.scad
$OpenSCAD -o inner_100mm.stl inner_100mm.scad
$OpenSCAD -o inner_100mm_fix.stl inner_100mm.scad -D shift_x=0 -D is_fix=true
$OpenSCAD -o inner_80mm.stl inner_80mm.scad
$OpenSCAD -o inner_uwv_100mm.stl inner_100mm.scad -D shift_x=6
$OpenSCAD -o inner_uwv_100mm_fix.stl inner_100mm.scad -D shift_x=6 -D is_fix=true