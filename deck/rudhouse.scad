module hull()
{
	union() {
		rotate([90, 0, 0]) cylinder(r = 6, h = 30, center = true, $fn = 20);
		rotate([0, -61, 0]) translate([1.65, 0, 23]) cube([15, 30, 50], center = true);
		rotate([0, 61, 0]) translate([-1.65, 0, 23]) cube([15, 30, 50], center = true);
		translate([0, 0, 35]) cube([30, 30, 50], center = true);
		cylinder(r = 6, h = 50, center = true);
	}
}

module rudder_housing() {
	union() {
		difference() {
			cube([25, 25, 20], center = true);
			translate([0, 0, 1]) rotate([6.8, 0, 0]) hull();
		}
	}
}

rudder_housing();