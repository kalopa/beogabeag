/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * Cap to prevent water ingress into the WDI.
 *
 * All dimensions are in mm.
 */
module base_plate()
{
	difference() {
		minkowski() {
			cube([26, 26, 1], center = true);
			cylinder(r = 3, h = 1, center = true);
		}
		translate([12, 12, 0]) cylinder(r = 4/2, h = 10, center = true);
		translate([12, -12, 0]) cylinder(r = 4/2, h = 10, center = true);
		translate([-12, 12, 0]) cylinder(r = 4/2, h = 10, center = true);
		translate([-12, -12, 0]) cylinder(r = 4/2, h = 10, center = true);
	}
}

module cap_ring()
{
	difference() {
		cylinder(r = 9/2, h = 2, center = true);
		cylinder(r = 7/2, h = 10, center = true);
	}
}

module cap_plate()
{
	difference() {
		union() {
			base_plate();
			translate([0, 0, 3.5]) cylinder(r = 13/2, h = 5, center = true);
			translate([0, 0, 7]) cap_ring();
		}
		cylinder(r = 11.2/2, h = 8.5, center = true);
		cylinder(r = 5/2, h = 20, center = true);
	}
}

cap_plate();
