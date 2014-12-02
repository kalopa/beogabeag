/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * All dimensions are in mm.
 */

use <buttress.scad>

tap_sizes = [0, 1, 1.5, 2.5, 3.3];
post_widths = [0, 6, 6, 8, 10];
soff_base = [0, 10, 10, 15, 20];

/*
 * Create a variety of screw posts.
 * Specify the height as a parameter.
 */
module screw_post(type, height)
{
	difference() {
		cylinder(r = post_widths[type]/2, h = height, center = true);
		cylinder(r = tap_sizes[type]/2, h = height + 1, center = true, $fn = 12);
	}
}

module hex_post(type, height)
{
	difference() {
		cylinder(r = post_widths[type]/2, h = height, center = true, $fn = 6);
		cylinder(r = tap_sizes[type]/2, h = height + 1, center = true, $fn = 12);
	}
}

module so_buttress(type, height)
{
	bh = height * 0.75;
	xoff = post_widths[type]/2 - 1;
	zoff = (bh - height)/2;
	translate([xoff, 0, zoff])
		buttress(bh, soff_base[type]/2 - xoff, 1.5);
}

module standoff(type, height)
{
	union() {
		translate([0, 0, -height/2]) {
			difference() {
				cylinder(r = soff_base[type]/2, h = 2, center = true, $fn = 20);
				cylinder(r = tap_sizes[type]/2, h = 3, center = true, $fn = 12);
			}
		}
		hex_post(type, height);
		rotate(a = [0, 0, 30])
			so_buttress(type, height);
		rotate(a = [0, 0, 150])
			so_buttress(type, height);
		rotate(a = [0, 0, 270])
			so_buttress(type, height);
	}
}

h1=15;
h2=35;
standoff(3, h1);
translate([0, 25, (h2-h1)/2])
	standoff(3, h2);
