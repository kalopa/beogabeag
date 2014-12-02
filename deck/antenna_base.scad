/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * All dimensions are in mm.
 */

module mast_mount()
{
	difference() {
		translate([0, 0, 15]) cylinder(r = 6.25, h = 30, center = true);
		translate([0, 0, 18]) cylinder(r = 4.25, h = 30, center = true);
	}
}

module support()
{
	intersection() {
		translate([-3.4, 0, 3.4]) rotate([0, 60, 0]) cube([20, 3, 20], center = true);
		translate([0, -5, 0]) cube([12, 10, 18]);
	}
}

module antenna_base()
{
	difference() {
		union() {
			cube([30, 30, 3], center = true);
			mast_mount();
			rotate([0, 0, 45]) translate([5.5, 0, 1.4]) support();
			rotate([0, 0, 135]) translate([5.5, 0, 1.4]) support();
			rotate([0, 0, 225]) translate([5.5, 0, 1.4]) support();
			rotate([0, 0, 315]) translate([5.5, 0, 1.4]) support();
		}
		translate([-10, 0, 0]) cylinder(r = 2, h = 4, center = true);
		translate([10, 0, 0]) cylinder(r = 2, h = 4, center = true);
		translate([0, 10, 0]) cylinder(r = 2, h = 4, center = true);
		translate([0, -10, 0]) cylinder(r = 2, h = 4, center = true);
	}
}

antenna_base();
