/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * All dimensions are in mm.
 */

use <screw_tab.scad>

box_width = 25;
box_length = 50;
box_depth = 25;
tab_length = 8;

/*
 * Raw PSU mounting box.
 */
module psu_box_raw()
{
	difference() {
		cube([box_width + 2, box_length + 2, box_depth], center = true);
		translate([0, 0, 2])
			cube([box_width, box_length, box_depth], center = true);
	}
}

/*
 * Mounting box with cable slots and screw tabs.
 */
module psu_box()
{
	union() {
		difference() {
			psu_box_raw();
			translate([0, (box_length + tab_length) / 2, box_depth / 2])
				rotate(a = [90, 90, 0])
					cylinder(r = box_width / 8, h = box_length + tab_length);
		}
		translate([0, (tab_length + box_length) / 2, -(box_depth - 2) / 2])
			rotate(a = [0, 0, 90])
				screw_tab(tab_length, 4, 2);
		translate([0, -(tab_length + box_length) / 2, -(box_depth - 2) / 2])
			rotate(a = [0, 0, -90])
				screw_tab(tab_length, 4, 2);
	}
}

psu_box();
