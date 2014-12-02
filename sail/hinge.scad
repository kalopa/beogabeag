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

module hinge_male()
{
	difference() {
		union() {
			translate([0, 10, 0]) cube([20, 40, 3], center = true);
			translate([0, 0, 3]) cylinder(r = 4, h = 6, center = true);
			translate([0, 0, 8]) sphere(r = 5, center = true);
		}
		translate([0, 0, 7.6]) cube([1.4, 10, 12], center = true);
	}
}

module hinge_female()
{
	difference() {
		translate([0, -10, 0]) cube([20, 40, 3], center = true);
		cylinder(r = 4.9, h = 5, center = true);
	}
}

translate([0, 11, 0]) hinge_male();
translate([0, -11, 0]) hinge_female();
