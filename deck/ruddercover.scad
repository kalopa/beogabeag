/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * All dimensions are in mm.
 */

use <stepper_box.scad>
use <../gears/rudder_big_gear.scad>
use <../gears/rudder_small_gear.scad>
use <../parts/nema17.scad>
use <../parts/posts_standoffs.scad>
use <../parts/uswitch.scad>

module rudderbox_wall()
{
	union() {
		difference() {
			cube([126, 91, 32], center = true);
			cube([120, 85, 34], center = true);
		}
		translate([-58.5, -41, 0]) rotate(a = [0, 0, 30]) hex_post(3, 32);
		translate([-58.5, 41, 0]) rotate(a = [0, 0, 30]) hex_post(3, 32);
		translate([0, -41, 0]) hex_post(3, 32);
		translate([58.5, -41, 0]) hex_post(3, 32);
		translate([0, 41, 0]) hex_post(3, 32);
		translate([58.5, 41, 0]) hex_post(3, 32);
	}
}

module rudder_bearing()
{
	difference() {
		cylinder(r = 22/2, h = 8, center = true);
		translate([0, 0, 3]) cylinder(r = 19.2/2, h = 8, center = true);
		cylinder(r = 11/2, h = 10, center = true);
	}
}

module rudder_cover()
{
	difference() {
		union() {
			translate([-20, 0, 0]) cube([120, 85, 3], center = true);
			translate([-20, 0, 14.5]) rudderbox_wall();
			translate([-52, 0, 5.5]) rudder_bearing();
			translate([-58, -41.6, 12]) rotate(a = [0, 270, 275]) microswitch_mount();
		}
		nema17_motor(3);
		translate([-32, -32, 3]) cylinder(r = 2.5, h = 10, center = true);
		translate([-32, 32, 3]) cylinder(r = 2.5, h = 10, center = true);
		translate([32, -32, 3]) cylinder(r = 2.5, h = 10, center = true);
		translate([32, 32, 3]) cylinder(r = 2.5, h = 10, center = true);
		translate([-52, 0, 20]) cylinder(r = 11/2, h = 50, center = true);
		translate([0, -26, 0]) cylinder(r = 3/2, h = 10, center = true);
	}
}

module assembly()
{
	union() {
		rudder_cover();
		#translate([0, 0, -6]) rotate(a = [180, 0, 0]) sail_stepper_box();
		#translate([0, 0, 20]) rotate(a = [180, 0, 0]) small_gear();
		#translate([-52, 0, 11]) rotate(a = [0, 0, -86]) big_gear();
		#translate([-58, -36, 12]) rotate(a = [0, 270, 275]) microswitch();
	}
}

rudder_cover();