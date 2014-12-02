/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * This is the definition for the five mast supports on the upper
 * leading-edge of the mast, A8 -> A12.
 *
 * All dimensions are in mm.
 */
module mast_step() {
	union() {
		difference() {
			cube([30, 20, 15], center = true);
			translate([0, 0, -5]) cube([15, 100, 5.5], center = true);
			translate([0, 0, -10]) cube([30, 100, 5], center = true);
		}
		translate([0, 0, 20]) cylinder(r = 8.5, h = 30, center = true);
	}
}

mast_step();