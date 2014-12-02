/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * This is the definition for the five mast supports on the upper
 * leading-edge of the mast, A8 -> A12.
 *
 * All dimensions are in mm.
 */
module stepdriver_box()
{
	difference() {
		union() {
			cylinder(r = 12, h = 36, center = true);
			translate([0, 0, -18]) cylinder(r = 22, h = 3, center = true);
		}
		translate([0, 0, -3]) cylinder(r = 9, h = 36, center = true);
		cylinder(r = 6, h = 50, center = true);
		translate([0, 16, -18]) cylinder(r = 2, h = 8, center = true);
		rotate(a = [0, 0, 120]) translate([0, 16, -18]) cylinder(r = 2, h = 8, center = true);
		rotate(a = [0, 0, 240]) translate([0, 16, -18]) cylinder(r = 2, h = 8, center = true);
	}
}

stepdriver_box();
