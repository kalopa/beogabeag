/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * All dimensions are in mm.
 */
module elongated_cylinder(er, eh, s)
{
	if (s > 0) {
		union() {
			translate([-s, 0, 0]) cylinder(r = er, h = eh, center = true);
			translate([s, 0, 0]) cylinder(r = er, h = eh, center = true);
			cube([s * 2, er * 2, eh], center = true);
		}
	} else {
		cylinder(r = er, h = eh, center = true);
	}
}

module nema17_shaft()
{
	difference() {
		cylinder(r = 6/2, h = 50, center = true, $fn = 20);
		translate([0, -4.5, 0]) cube([5, 5, 55], center = true);
	}
}

module nema17_motor(s)
{
	union() {
		translate([0, 0, 11]) nema17_shaft();
		elongated_cylinder(11.8, 10, s);
		translate([-15.51, -15.51, 0]) elongated_cylinder(2, 10, s);
		translate([-15.51, 15.51, 0]) elongated_cylinder(2, 10, s);
		translate([15.51, -15.51, 0]) elongated_cylinder(2, 10, s);
		translate([15.51, 15.51, 0]) elongated_cylinder(2, 10, s);
		translate([0, 0, -27]) cube(42 + 2*s, 42, 47, center = true);
	}
}

nema17_motor(4);
