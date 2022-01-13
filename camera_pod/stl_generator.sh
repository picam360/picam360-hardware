#!/bin/bash
#bash -x stl_generator.sh

OpenSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

$OpenSCAD -o base_seal_100mm_inner.stl -D tube_dia=100 -D is_inner=true base_seal.scad
$OpenSCAD -o base_seal_100mm_outer.stl -D tube_dia=100 -D is_inner=false base_seal.scad
$OpenSCAD -o base_seal_80mm_inner.stl -D tube_dia=80 -D is_inner=true base_seal.scad
$OpenSCAD -o base_seal_80mm_outer.stl -D tube_dia=80 -D is_inner=false base_seal.scad

$OpenSCAD -o cover_100mm.stl -D tube_dia=100 -D thread_h=15 cover.scad
$OpenSCAD -o cover_80mm.stl -D tube_dia=80 -D thread_h=10 cover.scad
$OpenSCAD -o cover_adapter_100mm.stl -D tube_dia=100 -D thread_h=15 cover_adapter.scad
$OpenSCAD -o cover_adapter_80mm.stl -D tube_dia=80 -D thread_h=10 cover_adapter.scad

$OpenSCAD -o camera_adapter_80mm.stl camera_adapter_80mm.scad
$OpenSCAD -o camera_seal_80mm.stl camera_seal_80mm.scad

$OpenSCAD -o joint_80mm_male.stl -D tube_dia=80 -D male=true joint.scad
$OpenSCAD -o joint_80mm_female.stl -D tube_dia=80 -D male=false joint.scad
$OpenSCAD -o joint_100mm_male.stl -D tube_dia=100 -D male=true joint.scad

$OpenSCAD -o stereo_joint.stl -D part="stereo_joint" stereo_joint.scad
$OpenSCAD -o stereo_joint_thread.stl -D part="thread" stereo_joint.scad
$OpenSCAD -o stereo_joint_holder.stl -D part="holder" stereo_joint.scad