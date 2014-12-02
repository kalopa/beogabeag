/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * All dimensions are in mm.
 */
module leaf(w)
{
	rotate(a = [0, 90, 0]) {
		difference() {
			union() {
				cylinder(r = 7.5, h = w, center = true);
				translate([0, 9, 0]) cube([15, 18, w], center = true);
			}
			cylinder(r = 2.6, h = 4, center = true);
		}
	}
}

module gopro_mount()
{
	union() {
		leaf(3.0);
		translate([-6, 0, 0]) leaf(2.5);
		translate([6, 0, 0]) leaf(2.5);
		translate([0, 13, 0]) cube([14, 10, 15], center = true);
	}
}

module shaft_mount()
{
	difference() {
		union() {
			cylinder(r = 6.1, h = 20, center = true);
			translate([0, -16, -2.5]) gopro_mount();
		}
		translate([0, 0, 3]) cylinder(r = 4.25, h = 20, center = true);
	}
}

shaft_mount();
