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
use <../parts/buttress.scad>

module attach_ring()
{
	cy = kicker_ring_dia * 0.6;
	bx = kicker_ring_dia * 0.3;
	by = kicker_ring_dia * 0.6;
	bz = -kicker_ring_dia * 0.5;
	difference() {
		union() {
			cylinder(r = kicker_ring_dia/2, h = wall_thickness, center = true);
			translate([0, cy/2, 0]) cube([kicker_ring_dia, cy, wall_thickness], center = true);
			translate([0, by, bz]) rotate([0, 0, -90]) buttress(bx, by, kicker_ring_dia);
			translate([0, by, -bz]) rotate([180, 0, -90]) buttress(bx, by, kicker_ring_dia);
		}
 		cylinder(r = attach_pin_dia/2, h = wall_thickness + 2, center = true);
	}
}

module kicker_ring()
{
	difference() {
		union() {
			cylinder(r = cf_mast_outer_dia/2 + wall_thickness, h = kicker_ring_dia, center = true);
			translate([0, -20, 0]) rotate([0, 90, 0])
				attach_ring();
		}
	 	cylinder(r = cf_mast_outer_dia/2, h = gooseneck_height + 2, center = true);
	}
}

kicker_ring();
