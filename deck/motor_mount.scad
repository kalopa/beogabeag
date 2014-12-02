module motor_screw()
{
	translate([0, 31/2, 50])
		cylinder(r = 3.2/2, h = 10, center = true);
}

module motor()
{
	mlen = 94;
	union() {
		cylinder(r = 37/2, h = mlen, center = true);
		translate([0, 7, 3 + mlen/2]) cylinder(r = 6.4, h = 10, center = true);
		rotate(a = [0, 0, 90]) motor_screw();
		rotate(a = [0, 0, 270]) motor_screw();
	}
}

module motor_wall(t, l, h)
{
	intersection() {
		cube([t, l, h], center = true);
		translate([0, -l/3, -h/5])
			rotate(a = [-45, 0, 0])
				cube([t, l, h], center = true);
	}
}

module motor_mount()
{
	thickness = 6;
	length = 90;
	height = 40;
	width = 50;
	difference() {
		union()  {
			cube([width, length, thickness], center = true);
			translate([0, -(length - thickness)/2, (height + thickness)/2])
				cube([width, thickness, height], center = true);
			translate([-(width - thickness)/2, 0, (height + thickness)/2])
				motor_wall(thickness, length, height);
			translate([(width - thickness)/2, 0, (height + thickness)/2])
				motor_wall(thickness, length, height);
		}
		translate([0, 9, 37/2 + thickness/2 + 1])
			rotate(a = [90, 180, 0]) motor();
		translate([width/2 - thickness - 5, length/2 - thickness - 5, 0])
			cylinder(r = 4.5/2, h = thickness + 2, center = true);
		translate([-(width/2 - thickness - 5), length/2 - thickness - 5, 0])
			cylinder(r = 4.5/2, h = thickness + 2, center = true);
		translate([width/2 - thickness - 5, 0, 0])
			cylinder(r = 4.5/2, h = thickness + 2, center = true);
		translate([-(width/2 - thickness - 5), 0, 0])
			cylinder(r = 4.5/2, h = thickness + 2, center = true);
		translate([width/2 - thickness - 5, -(length/2 - thickness - 5), 0])
			cylinder(r = 4.5/2, h = thickness + 2, center = true);
		translate([-(width/2 - thickness - 5), -(length/2 - thickness - 5), 0])
			cylinder(r = 4.5/2, h = thickness + 2, center = true);
	}
}

motor_mount();