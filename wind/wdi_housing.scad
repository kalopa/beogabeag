/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * Cap to prevent water ingress into the WDI.
 *
 * All dimensions are in mm.
 */
module wdi_box()
{
	difference() {
		minkowski() {
			cube([26, 26, 20], center = true);
			cylinder(r = 3, h = 20, center = true);
		}
		translate([0, 0, 2]) cube([28, 28, 40], center = true);
		cylinder(r = 5/2, h = 50, center = true);
	}
}

module shaft_mount()
{
	difference() {
		union() {
			cylinder(r = 6.1, h = 20, center = true);
			translate([-4, 0, 0]) cube([7, 12.2, 20], center = true);
		}
		translate([0, 0, 3]) cylinder(r = 4.25, h = 20, center = true);
	}
}
module wdi_housing()
{
	difference() {
		union() {
			wdi_box();
			translate([11, 11, 0]) cylinder(r = 4, h = 40, center = true);
			translate([11, -11, 0]) cylinder(r = 4, h = 40, center = true);
			translate([-11, 11, 0]) cylinder(r = 4, h = 40, center = true);
			translate([-11, -11, 0]) cylinder(r = 4, h = 40, center = true);
			translate([22, 0, -10]) shaft_mount();
		}
		translate([11, 11, 0]) cylinder(r = 4/2, h = 50, center = true);
		translate([11, -11, 0]) cylinder(r = 4/2, h = 50, center = true);
		translate([-11, 11, 0]) cylinder(r = 4/2, h = 50, center = true);
		translate([-11, -11, 0]) cylinder(r = 4/2, h = 50, center = true);
	}
}

wdi_housing();
