/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * This is the definition for the five mast supports on the upper
 * leading-edge of the mast, A8 -> A12.
 *
 * All dimensions are in mm.
 */
include <constants.scad>

use <naca0018.scad>

module upper_support(off)
{
	difference() {
		naca0018(off, 2);
		translate([1, 0, 0]) rotate(a = [0, 10, 0]) cylinder(r = le_tube_radius, h = 10, center = true);
		translate([off*0.9173, 0, 6]) rotate(a = [0, 3.5, 0]) cube([26, te_depth, 20], center = true);
		translate([off / 3, 0, 0]) cylinder(r = 2, h = 12, center = true);
	}
}

translate([0, -60, 0]) upper_support(123.787);
translate([0, -30, 0]) upper_support(114.574);
translate([0, 0, 0]) upper_support(105.361);
translate([0, 30, 0]) upper_support(96.147);
translate([0, 60, 0]) upper_support(86.934);
