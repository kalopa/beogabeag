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

module moconboard()
{
	color("green") {
		difference() {
			cube([127, 1.5, 101.6], center = true);
			translate([57.5, 0, 44]) rotate([90, 0, 0]) cylinder(r = 2, h = 10, center = true);
			translate([57.5, 0, -44]) rotate([90, 0, 0]) cylinder(r = 2, h = 10, center = true);
			translate([-57.5, 0, 44]) rotate([90, 0, 0]) cylinder(r = 2, h = 10, center = true);
			translate([-57.5, 0, -44]) rotate([90, 0, 0]) cylinder(r = 2, h = 10, center = true);
		}
	}
}

module board_support()
{
	difference() {
		cube([12, 16, 8], center = true);
		cylinder(r = 2, h = 20, center = true);

	}
}

module deck_lid()
{
	difference() {
		minkowski() {
			cube([140, 30, 2], center = true);
			cylinder(r = 12, h = 2, center = true);
		}
		translate([-71, -16, 0]) cylinder(r = 2, h = 10, center = true);
		translate([-71, 16, 0]) cylinder(r = 2, h = 10, center = true);
		translate([71, -16, 0]) cylinder(r = 2, h = 10, center = true);
		translate([71, 16, 0]) cylinder(r = 2, h = 10, center = true);
	}
}

module mocon_lid()
{
	union() {
		deck_lid();
		/*#translate([0, 6.5, 53]) moconboard();*/
		translate([-57.5, 2, 9]) rotate([90, 0, 0]) board_support();
		translate([57.5, 2, 9]) rotate([90, 0, 0]) board_support();
	}
}

mocon_lid();
