/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * All dimensions are in mm.
 */
use <mast1.scad>
use <mast2.scad>
use <mast3.scad>

module main_sail()
{
	union() {
		#translate([111, 0, 481]) rotate([0, 3.5, 0]) cube([20, 6, 964], center = true);
		#translate([-19, 0, 282]) rotate([0, 3.5, 0]) cylinder(r = 4.0, h = 564, center = true);
		#translate([33, 0, 761]) rotate([0, 10, 0]) cylinder(r = 4.0, h = 409, center = true);
		translate([-37, 0, 0]) mast_support_1(37);
		translate([-32.116, 0, 80]) mast_support_2(32.116);
		translate([-27.232, 0, 160]) mast_support_2(27.232);
		translate([-22.348, 0, 240]) mast_support_1(22.348);
		translate([-17.464, 0, 320]) lower_front_support();
		translate([-12.580, 0, 400]) lower_front_support();
		translate([-7.697, 0, 480]) lower_front_support();
		translate([-2.813, 0, 560]) lower_top_section();
		translate([11.079, 0, 640]) upper_support(123.787);
		translate([24.971, 0, 720]) upper_support(114.574);
		translate([38.863, 0, 800]) upper_support(105.361);
		translate([52.754, 0, 880]) upper_support(96.147);
		translate([66.646, 0, 960]) upper_support(86.934);
	}
}

module deck_base()
{
	union() {
		cube([200, 100, 5], center = true);
		translate([0, 0, 150]) cylinder(r = 4.0, h = 300, center = true);
	}
}

module sail_assembly()
{
	union() {
		translate([0, 0, 10]) main_sail();
		#deck_base();
	}
}

sail_assembly();
