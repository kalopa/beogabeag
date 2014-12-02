/*
 * Spindle is 40mm outer edge, and has a 10.5mm slot for three
 * windings of the sheet.
 *
 * Inner diameter is 32mm.  Edge is 2mm.  Mounted on an 8mm shaft
 * thing, with a waterproof collar.
 */

use <../parts/nema17.scad>

module winch()
{
	union() {
		/*
		 * Top winch plates
		 */
		translate([0, 0, 10.5/2]) cylinder(r = 40/2, h = 2, center = true);
		cylinder(r = 32/2, h = 10.5, center = true, $fn = 60);
		translate([0, 0, -10.5/2]) cylinder(r = 40/2, h = 2, center = true);
		/*
		 * Outer skirt
		 */
		difference() {
			translate([0, 0, 12]) cylinder(r = 38/2, h = 12, center = true);
			translate([0, 0, 12]) cylinder(r = 36/2, h = 13, center = true);
		}
	}
}

module winch_gear()
{
	difference() {
		union() {
			winch();
			/*
			 * Shaft collar
			 */
			translate([0, 0, 11]) cylinder(r = 9, h = 10, center = true);
		}
		nema17_shaft();
		translate([0, -4.4, 12]) cube([5.75, 3.3, 10], center = true);
		translate([0, -12, 11]) rotate(a = [90, 0, 0]) cylinder(r = 3.9/2, h = 22, center = true);
		translate([0, -15, 11]) rotate(a = [90, 0, 0]) cylinder(r = 6/2, h = 12, center = true);
	}
}

winch_gear();
