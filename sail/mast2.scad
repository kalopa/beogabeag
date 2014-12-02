/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * This is the definition for the four mast supports on the lower
 * leading-edge of the mast, A4 -> A7.
 *
 * All dimensions are in mm.
 */
include <constants.scad>

use <naca0018.scad>

module lower_front_support()
{
	difference() {
		naca0018(a_section_chord, 3);
		translate([1, 0, 0]) rotate(a = [0, 3.5, 0]) cylinder(r = le_tube_radius, h = 10, center = true);
		translate([122, 0, 6]) rotate(a = [0, 3.5, 0]) cube([26, te_depth, 20], center = true);
		translate([a_section_chord / 2, 0, 0]) cylinder(r = 2, h = 12, center = true);
	}
}

module lower_top_section()
{
	difference() {
		union() {
			lower_front_support();
			translate([5, 0, 6]) cylinder(r = 5, h = 12, center = true);
		}
		translate([1, 0, 6]) rotate(a = [0, 10, 0]) cylinder(r = le_tube_radius, h = 20, center = true);
	}
}

translate([0, -45, 0]) lower_front_support();
translate([0, -15, 0]) lower_front_support();
translate([0, 15, 0]) lower_front_support();
translate([0, 45, 0]) lower_top_section();
