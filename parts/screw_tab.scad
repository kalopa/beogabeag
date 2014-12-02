/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * All dimensions are in mm.
 */

/*
 * Create a screw tab to be attached to something like a
 * box or plate.
 */
module screw_tab(length, screw_dia, thickness)
{
	tab_width = screw_dia * 3;
	difference() {
		union() {
			cube([length, tab_width, thickness], center = true);
			translate([length / 2, 0, 0])
				cylinder(r = tab_width / 2, h = thickness, center = true);
		}
		translate([length / 2, 0, 0])
			cylinder(r = screw_dia / 2, h = thickness + 2, center = true);
	}
}

screw_tab(20, 4, 2);
