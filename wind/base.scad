/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * All dimensions are in mm.
 */

include <common.scad>

cable_width = 4.1;

mast_diameter = 8.2;
collar_height = 25;
collar_thickness = 3;

module cable_slot()
{
	union() {
		translate([0, gland_position, 2])
			cylinder(r = cable_width/2, h = 8, center = true, $fn = 12);
		translate([0, -cap_radius + cable_width/2, 0])
			cube([cable_width, cap_radius, 8], center = true);
	}
}

module collar_support()
{
	translate([0, 0, collar_height/2])
		rotate(a = [90, 30, 0])
			cylinder(r = collar_height * 0.75, h = wall_thickness, $fn = 3);
}

module mhl_base()
{
	collar_radius = collar_thickness + mast_diameter/2;
	union() {
		/*
		 * Base cap, mounting holes and cable slot.
		 */
		difference() {
			color([0.3, 0, 1]) cylinder(r = cap_radius, h = wall_thickness, center = true);
			screw_holes();
			cable_slot();
		}
		/*
		 * Mast collar.
		 */
		translate([0, 0, collar_height/2])
			difference() {
				cylinder(r = collar_radius, h = collar_height, center = true, $fn = 20);
				cylinder(r = mast_diameter/2, h = collar_height + 2, center = true, $fn = 12);
			}
		/*
		 * Collar supports.
		 */
		difference() {
			collar_support();
			%cube([collar_radius, collar_radius, collar_height]);
		}
	}
}

mhl_base();
