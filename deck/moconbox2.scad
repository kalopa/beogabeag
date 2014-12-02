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
		translate([0, 0, 3]) cube([136, 26, 115], center = true);
		translate([30, 13, -20]) rotate([90, 0, 0]) cylinder(r = 2, h = 10, center = true);
		translate([10, 13, -20]) rotate([90, 0, 0]) cylinder(r = 2, h = 10, center = true);
		translate([-10, 13, -20]) rotate([90, 0, 0]) cylinder(r = 2, h = 10, center = true);
		translate([-30, 13, -20]) rotate([90, 0, 0]) cylinder(r = 2, h = 10, center = true);
		cube([130, 20, 115], center = true);

	}
}

module deck_mounting()
{
	difference() {
		minkowski() {
			cube([140, 30, 2], center = true);
			cylinder(r = 12, h = 2, center = true);
		}
		translate([-71, -16, 6]) m4_nut_trap();
		translate([-71, 16, 6]) m4_nut_trap();
		translate([71, -16, 6]) m4_nut_trap();
		translate([71, 16, 6]) m4_nut_trap();
		cube([130, 20, 115], center = true);
	}
}

module mocon_box()
{
	difference() {
		union() {
			board_housing();
			translate([0, 0, -56]) deck_mounting();
		}
		cube([130, 20, 115], center = true);
	}
}

mocon_box();
