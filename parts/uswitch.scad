/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * All dimensions are in mm.
 */
module microswitch()
{
	difference() {
		union() {
			cube([19.83, 10.5, 6.3], center = true);
			translate([2.9, 5.7, 0]) cube([2, 1, 3.4], center = true);
			translate([-7.2, -7, 0]) cube([0.5, 3.5, 3], center = true);
			translate([0, -7, 0]) cube([0.5, 3.5, 3], center = true);
			translate([7.2, -7, 0]) cube([0.5, 3.5, 3], center = true);
		}
		translate([-4.6, -2.5, 0]) cylinder(r = 2.5/2, h = 12, center = true);
		translate([4.6, -2.5, 0]) cylinder(r = 2.5/2, h = 12, center = true);
	}
}

module microswitch_mount()
{
	difference() {
		cube([22, 10.5, 5], center = true);
		translate([-4.6, -2.5, 0]) cylinder(r = 1.5/2, h = 12, center = true);
		translate([4.6, -2.5, 0]) cylinder(r = 1.5/2, h = 12, center = true);
	}
}

microswitch();
