/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * This is the definition for the five mast supports on the upper
 * leading-edge of the mast, A8 -> A12.
 *
 * All dimensions are in mm.
 */

module m4_nut_trap()
{
	union() {
		translate([0, 0, -2]) cylinder(r = 4, h = 8, $fn = 6, center = true);
		cylinder(r = 2, h = 20, center = true, $fn = 20);
	}
}

module board_housing()
{
	difference() {
		translate([0, 0, 2]) cube([111, 136, 23], center = true);
		translate([-20, -65, 0]) rotate([90, 0, 0]) cylinder(r = 2, h = 10, center = true);
		translate([20, -65, 0]) rotate([90, 0, 0]) cylinder(r = 2, h = 10, center = true);
		translate([-20, 65, 0]) rotate([90, 0, 0]) cylinder(r = 2, h = 10, center = true);
		translate([20, 65, 0]) rotate([90, 0, 0]) cylinder(r = 2, h = 10, center = true);
	}
}

module deck_mounting()
{
	difference() {
		minkowski() {
			cube([110, 135, 2], center = true);
			cylinder(r = 10, h = 2, center = true);
		}
		translate([-59, -70, 6]) m4_nut_trap();
		translate([-59, 70, 6]) m4_nut_trap();
		translate([59, -70, 6]) m4_nut_trap();
		translate([59, 70, 6]) m4_nut_trap();
	}
}

module mocon_box()
{
	difference() {
		union() {
			board_housing();
			translate([0, 0, -7.5]) deck_mounting();
		}
		cube([105, 130, 20], center = true);
	}
}

mocon_box();
