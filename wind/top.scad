/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * All dimensions are in mm.
 */

include <common.scad>

/*
 * LED Divider and screw post.
 */
module led_divider()
{
	l = cap_radius - inner_radius;
	union() {
		/*
		 * Screw post first...
		 */
		translate([0, inner_radius - screw_post_radius + 3.3/2, 0])
			difference() {
				color([0.5, 0, 0]) cylinder(r = screw_post_radius, h = cap_height, center = true);
				cylinder(r = 2.5/2, h = cap_height + 1, center = true, $fn = 12);
			}
		/*
		 * Now the partition between the LEDs.
		 */
		translate([0, inner_radius + l / 2, 0])
			cube([wall_thickness, l, cap_height], center = true);
	}
}

/*
 * LED mounting hole.
 */
module led_mount()
{
	translate([0, inner_radius + wall_thickness / 2, 0])
		rotate(a = [90, 90, 0])
			cylinder(r = 2.5, h = 3, center = true, $fn = 12);
}

/*
 * Inner housing for pots.
 */
module inner_housing()
{
	union() {
		difference() {
			/*
			 * Main housing is a cylinder minus the inside and minus the
			 * holes for the LEDs.
			 */
			color([0.3, 0, 1]) cylinder(r = inner_radius+wall_thickness, h = cap_height, center = true);
			cylinder(r = inner_radius, h = cap_height + 1, center = true);
			rotate(a = [0, 0, rg_angle/2])
				led_mount();
			rotate(a = [0, 0, -rg_angle/2])
				led_mount();
			rotate(a = [0, 0, 180])
				led_mount();
		}
		/*
		 * Divider walls between the three LEDs.
		 */
		color("silver") led_divider();
		rotate(a = [0, 0, rg_angle])
			color("green") led_divider();
		rotate(a = [0, 0, -rg_angle])
			color("red") led_divider();
		/*
		 * Bearing housing
		 */
		translate([0, 0, -(cap_height - bearing_height) / 2])
			difference() {
				color("blue") cylinder(r = wall_thickness + bearing_diameter/2, h = bearing_height, center = true);
				cylinder(r = bearing_diameter/2, h = bearing_height + 1, center = true);
			}
	}
}

module mhl_upper()
{
	union() {
		end_cap(0.5 + wind_shaft_diameter/2);
		/*
		 * Cheesy triangle to show where the front is.
		 * I'm sure there's a better way, but...
		 */
		translate([0, inner_radius, wall_thickness])
			rotate(a = [0, 0, 45])
				color([0.8, 0.8, 0.3]) cube([10, 10, 2], center = true);
		/*
		 * Add the inner housing...
		 */
		translate([0, 0, (cap_height + wall_thickness)/2])
			inner_housing();
	}
}

mhl_upper();
