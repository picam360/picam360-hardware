#!/bin/bash
#bash -x stl_generator.sh

OpenSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

$OpenSCAD -o base_seal_100mm_inner.stl -D tube_dia=100 -D is_inner=true base_seal.scad
$OpenSCAD -o base_seal_100mm_outer.stl -D tube_dia=100 -D is_inner=false base_seal.scad
$OpenSCAD -o base_seal_60mm_inner.stl -D tube_dia=60 -D is_inner=true base_seal.scad
$OpenSCAD -o base_seal_60mm_outer.stl -D tube_dia=60 -D is_inner=false base_seal.scad

$OpenSCAD -o cover_100mm.stl -D tube_dia=100 -D thread_h=15 cover.scad
$OpenSCAD -o cover_60mm.stl -D tube_dia=60 -D thread_h=10 cover.scad
$OpenSCAD -o cover_adapter_100mm.stl -D tube_dia=100 -D thread_h=15 cover_adapter.scad
$OpenSCAD -o cover_adapter_60mm.stl -D tube_dia=60 -D thread_h=10 cover_adapter.scad

$OpenSCAD -o camera_adapter_60mm.stl camera_adapter_60mm.scad
$OpenSCAD -o camera_seal_60mm.stl camera_seal_60mm.scad

$OpenSCAD -o joint_single.stl -D stereo=false joint.scad
$OpenSCAD -o joint_stereo.stl -D stereo=true joint.scad