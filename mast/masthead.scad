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

module masthead()
{
	difference() {
		union() {
			cylinder(r = mast_cap_dia/2, h = mast_cap_height, center = true);
			translate([0, 0, 16.5])
				cylinder(r = cf_mast_inner_dia/2, h = cf_mast_insert_len, center = true);
		}
		translate([0, 0, rigging_line_dia/2]) rotate([90, 0, 0])
				cylinder(r = rigging_line_dia/2, h = mast_cap_dia + 10, center = true);
		translate([0, 0, -rigging_line_dia/2]) rotate([0, 90, 0])
				cylinder(r = rigging_line_dia/2, h = mast_cap_dia + 10, center = true);
	}
}

masthead();
