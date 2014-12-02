/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * All dimensions are in mm.
 */

include <common.scad>

cable_width = 4.1;

mount_thickness = 1;
mount_width = 16;
mount_height = 9;

module cable_gland()
{
	difference() {
		cylinder(r = 3, h = 4, center = true, $fn = 12);
		cylinder(r = cable_width/2, h = 5, center = true, $fn = 12);
	}
}

module mhl_mounting()
{
	union() {
		/*
		 * End cap and mounting holes.
		 */
		difference()  {
			end_cap(0);
			screw_holes();
			translate([0, gland_position, 2])
				cylinder(r = cable_width/2, h = 8, center = true, $fn = 12);
		}
		/*
		 * Potentiometer stands.
		 */
		translate([6.5, 0, mount_height/2])
			cube([mount_thickness, mount_width, mount_height], center = true);
		translate([-6.5, 0, mount_height/2])
			cube([mount_thickness, mount_width, mount_height], center = true);
		/*
		 * The cable gland.
		 */
		translate([0, gland_position, 2])
			cable_gland();
	}
}

mhl_mounting();
