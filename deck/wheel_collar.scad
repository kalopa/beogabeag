/*
 *
 */
module shaft()
{
	shaft_dia = 6.9;
	difference() {
		cylinder(r = shaft_dia/2, h = 15, center = true, $fn = 20);
		translate([0, shaft_dia - 0.5, 0])
			cube([shaft_dia, shaft_dia, 15 + 2], center = true);
	}
}

module wheel_collar()
{
	outer_dia = 22;
	inner_dia = 12.6;
	length = 40;
	difference() {
		union() {
			cylinder(r = outer_dia/2, h = 4, center = true);
			translate([0, 0, length/2 - 2])
				cylinder(r = inner_dia/2, h = length, center = true);
		}
		translate([0, 0, 4])
			shaft();
	}
}

wheel_collar();