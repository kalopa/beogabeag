/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * All dimensions are in mm.
 */

use <stepper_box.scad>
use <../gears/sail_winch.scad>
use <../parts/nema17.scad>
use <../parts/posts_standoffs.scad>

module sailbox_wall()
{
	union() {
		difference() {
			cube([86, 86, 32], center = true);
			cube([80, 80, 34], center = true);
			translate([16, -6, 5.5]) rotate(a = [90, 0, 0]) cylinder(r = 4, h = 40);
			translate([-16, -6, 5.5]) rotate(a = [90, 0, 0]) cylinder(r = 4, h = 40);
			translate([5, 50, -11.5]) rotate(a = [90, 0, 0]) cylinder(r = 1.5, h = 20);
		}
		translate([-38.5, 0, 0]) rotate(a = [0, 0, 30]) hex_post(3, 32);
		translate([38.5, 0, 0]) rotate(a = [0, 0, 30]) hex_post(3, 32);
		translate([0, -38.5, 0]) hex_post(3, 32);
		translate([0, 38.5, 0]) hex_post(3, 32);
	}
}

module sail_cover()
{
	difference() {
		union() {
			cube([80, 80, 3], center = true);
			translate([0, 0, 14.5]) sailbox_wall();
			/*
			 * Inner skirt
			 */
			difference() {
				translate([0, 0, 7]) cylinder(r = 34/2, h = 12, center = true);
				translate([0, 0, 7]) cylinder(r = 32/2, h = 13, center = true);
				rotate(a = [0, 0, -135]) translate([0, -15, 9]) rotate(a = [90, 0, 0]) cylinder(r = 6/2, h = 12, center = true);
			}
		}
		nema17_motor(0);
		translate([-32, -32, 3]) cylinder(r = 2.5, h = 10, center = true);
		translate([-32, 32, 3]) cylinder(r = 2.5, h = 10, center = true);
		translate([32, -32, 3]) cylinder(r = 2.5, h = 10, center = true);
		translate([32, 32, 3]) cylinder(r = 2.5, h = 10, center = true);
	}
}

module assembly()
{
	union() {
		sail_cover();
		#translate([0, 0, -6]) rotate(a = [180, 0, 0]) sail_stepper_box();
		#translate([0, 0, 20]) rotate(a = [180, 0, 45]) winch_gear();
	}
}

sail_cover();