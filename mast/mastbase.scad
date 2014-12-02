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

module mastbase()
{
	difference() {
		union() {
			cube([mast_base_x, mast_base_y, mast_base_height], center = true);
			translate([0, 0, 16])
				cylinder(r = cf_mast_inner_dia/2, h = cf_mast_insert_len, center = true);
		}
		rotate([0, 90, 0])
			cylinder(r = rigging_line_dia/2, h = 40, center = true);
		translate([mast_base_grip_off, 0, -mast_base_height/2]) rotate([90, 0, 0])
			cylinder(r = mast_base_grip_dia/2, h = mast_base_y + 10, center = true, $fn = 6);
		translate([0, 0, -mast_base_height/2]) rotate([90, 0, 0])
			cylinder(r = mast_base_grip_dia/2, h = mast_base_y + 10, center = true, $fn = 6);
		translate([-mast_base_grip_off, 0, -mast_base_height/2]) rotate([90, 0, 0])
			cylinder(r = mast_base_grip_dia/2, h = mast_base_y + 10, center = true, $fn = 6);
	}
}

mastbase();
