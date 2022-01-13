#!/bin/bash
#bash -x stl_generator.sh

OpenSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

$OpenSCAD -o skrew_extender.stl skrew_extender.scad
$OpenSCAD -o skrew_stand.stl skrew_stand.scad
$OpenSCAD -o skrew_mount.stl skrew_mount.scad
$OpenSCAD -o skrew_mount_cover.stl skrew_mount_cover.scad