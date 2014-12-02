/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * All dimensions are in mm.
 */

include <common.scad>
use <rotary.scad>
use <top.scad>
use <mount.scad>
use <base.scad>

translate([0, 0, 50])
	rotate(a = [180, 0, 180])
		mhl_upper();
if (1) {
	translate([0, 0.5, 14])
		rotary_sensor();
	translate([0, 0.5, 18]) rotate(a = [0, 180, 180])
		rotary_sensor();
}
mhl_mounting();
translate([0, 0, -10])
	rotate(a = [180, 0, 180])
		mhl_base();
