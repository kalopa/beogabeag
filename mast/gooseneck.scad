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

module att_wedge(height)
{
	difference() {
		cube([26, gooseneck_len, height], center = true);
		translate([16, 10, 0]) rotate([0, 0, 22])
			cube([20, 50, 30], center = true);
		translate([-16, 10, 0]) rotate([0, 0, -22])
			cube([20, 50, 30], center = true);
	}

}

module attachment(height)
{
	difference() {
		union() {
			att_wedge(height);
			translate([0, gooseneck_len * 0.4, 0])
				cylinder(r = gooseneck_barrel_dia/2, h = height, center = true);
		}
	 	translate([0, gooseneck_len * 0.4, 0])
	 		cylinder(r = attach_pin_dia/2, h = height + 2, center = true);
	}
}

module gooseneck()
{
 	difference() {
 		union() {
			cylinder(r = cf_mast_outer_dia/2 + wall_thickness, h = gooseneck_height, center = true);
			translate([0, 14, 0])
				attachment(gooseneck_height);
		}
	 	cylinder(r = cf_mast_outer_dia/2, h = gooseneck_height + 2, center = true);
	 	translate([0, 15, 0])
	 		cylinder(r = rigging_line_dia/2, h = gooseneck_height + 2, center = true);
	}
}

module goose_attach()
{
	h = gooseneck_height + (washer_thickness + wall_thickness) * 2;
	d = (gooseneck_height + wall_thickness) / 2 + washer_thickness;
	l = (gooseneck_len + wall_thickness) / 2;
	difference() {
		union() {
			cube([gooseplate_width, h, wall_thickness], center = true);
			translate([0, d, l]) rotate([90, 0, 0])
				attachment(wall_thickness);
			translate([0, -d, l]) rotate([90, 0, 0])
				attachment(wall_thickness);
		}
		cylinder(r = 4/2, h = wall_thickness + 2, center = true);
	}
}

module boom_attach()
{
	h = gooseneck_height + (washer_thickness + wall_thickness) * 2;
	difference() {
		union() {
			cube([gooseplate_width, h, wall_thickness], center = true);
			translate([0, 0, (wall_thickness + cf_mast_insert_len)/2])
				cylinder(r = cf_mast_inner_dia/2, h = cf_mast_insert_len, center = true);
		}
		cylinder(r = 4/2, h = wall_thickness + 2, center = true);
	}
}

gooseneck();
translate([0, 42, 0]) rotate([90, 0, 0]) goose_attach();
translate([0, 48, 0]) rotate([-90, 0, 0]) boom_attach();