/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * This is the definition for the four mast supports on the lower
 * leading-edge of the mast, A0 -> A3.
 *
 * All dimensions are in mm.
 */
include <constants.scad>

use <naca0018.scad>

module skate_bearing()
{
	difference() {
		cylinder(r = bearing_outer_radius, h = bearing_height, center = true);
		cylinder(r = bearing_inner_radius, h = bearing_height + 2, center = true);
	}
}

module mast_support_1(off)
{
	difference() {
		union() {
			naca0018(a_section_chord, 5);
			translate([off, 0, 4.5]) cylinder(r = bearing_outer_radius + 2.0, h = 9, center = true);
			translate([5, 0, 6]) cylinder(r = 5, h = 8, center = true);
		}
		translate([off, 0, 6]) skate_bearing();
		translate([off, 0, 0]) cylinder(r = mast_clearance_radius, h = 20, center = true);
		translate([1, 0, 6]) rotate(a = [0, 3.5, 0]) cylinder(r = le_tube_radius, h = 20, center = true);
		translate([122, 0, 6]) rotate(a = [0, 3.5, 0]) cube([26, te_depth, 20], center = true);
		translate([a_section_chord / 2, 0, 0]) cylinder(r = 2, h = 12, center = true);
		translate([a_section_chord * 2 / 3, 0, 0]) cylinder(r = 1.5, h = 12, center = true);
	}
}

module mast_support_2(off)
{
	difference() {
		naca0018(a_section_chord, 3);
		translate([off, 0, 0]) cylinder(r = mast_clearance_radius, h = 10, center = true);
		translate([1, 0, 0]) rotate(a = [0, 3.5, 0]) cylinder(r = le_tube_radius, h = 10, center = true);
		translate([122, 0, 6]) rotate(a = [0, 3.5, 0]) cube([26, te_depth, 20], center = true);
		translate([a_section_chord / 2, 0, 0]) cylinder(r = 2, h = 12, center = true);
	}
}

translate([0, -45, 0]) mast_support_1(37);
translate([0, -15, 0]) mast_support_2(32.116);
translate([0, 15, 0]) mast_support_2(27.232);
translate([0, 45, 0]) mast_support_1(22.348);
