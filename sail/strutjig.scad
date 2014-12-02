/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * This is the jig for glueing the struts to the leading and
 * trailing edges.
 *
 * All dimensions are in mm.
 */
include <constants.scad>

module strut_jig()
{
	difference() {
		union() {
			cube([90, 60, 1.6], center = true);
			translate([-42, -27, 8]) cube([6, 6, 16], center = true);
			translate([-42, 27, 8]) cube([6, 6, 16], center = true);
			translate([38, -27, 8]) cube([6, 6, 16], center = true);
			translate([38, 27, 8]) cube([6, 6, 16], center = true);
		}
		translate([-20, -20, 0]) cylinder(r = 1, h = 4, center = true);
		translate([-20, 20, 0]) cylinder(r = 1, h = 4, center = true);
		translate([20, -20, 0]) cylinder(r = 1, h = 4, center = true);
		translate([20, 20, 0]) cylinder(r = 1, h = 4, center = true);
	}
}

strut_jig();
