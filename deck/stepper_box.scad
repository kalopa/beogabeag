module box(x, y, z)
{
	minkowski() {
		cube([x - 20, y - 20, z], center = true);
		cylinder(r = 10, h = z, center = true);
	}
}

module m4_nut_trap()
{
	union() {
		translate([0, 0, -2]) cylinder(r = 4, h = 8, $fn = 6, center = true);
		cylinder(r = 2, h = 20, center = true, $fn = 20);
	}
}

module rudder_shaft()
{
	difference() {
		union() {
			cylinder(r = 8, h = 10, center = true);
			translate([7, 0, -3]) cube([12, 16, 4], center = true);
		}
		cylinder(r = 11/2, h = 20, center = true);
	}
}

module stepper_base()
{
	difference() {
		union() {
			box(80, 80, 2);
			translate([-32, -32, 3]) cylinder(r = 7.1, h = 10, center = true);
			translate([-32, 32, 3]) cylinder(r = 7.1, h = 10, center = true);
			translate([32, -32, 3]) cylinder(r = 7.1, h = 10, center = true);
			translate([32, 32, 3]) cylinder(r = 7.1, h = 10, center = true);
			translate([-52, 0, 3]) rudder_shaft();
		}
		translate([-32, -32, 3]) m4_nut_trap();
		translate([-32, 32, 3]) m4_nut_trap();
		translate([32, -32, 3]) m4_nut_trap();
		translate([32, 32, 3]) m4_nut_trap();
	}
}

module rudder_stepper_box()
{
	difference() {
		union() {
			translate([0, 0, 25]) box(63, 63, 25);
			stepper_base();
		}
		translate([0, 0, 22]) box(60, 60, 25);
		translate([-30, 15, 25]) rotate(a = [0, 90, 0])
				cylinder(r = 2.5, h = 10, center = true);
	}
}

module sail_stepper_box()
{
	difference() {
		union() {
			translate([0, 0, 25]) box(63, 63, 25);
			stepper_base();
		}
		translate([0, 0, 22]) box(60, 60, 25);
		translate([-30, 0, 25]) rotate(a = [0, 90, 0])
				cylinder(r = 2.5, h = 10, center = true);
	}
}

rudder_stepper_box();