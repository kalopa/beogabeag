/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * All dimensions are in mm.
 */

plate_length = 236;
plate_width = 120;
plate_height = 90;
plate_thickness = 3;

bend_radius = 12.5;

keelbolt_sep = 125;
keelbolt_dia = 13;

mount_dia = 4;

/*
 * Curved edges...
 */
module plate_bend()
{
	intersection() {
		difference() {
			cylinder(r = bend_radius, h = plate_width, center = true);
			cylinder(r = bend_radius - plate_thickness, h = plate_width + 1, center = true);
		}
		translate([bend_radius/2, bend_radius/2, 0])
			cube([bend_radius, bend_radius, plate_width], center = true);
	}
}

/*
 * Mounting holes
 */
module mounting_holes()
{
	rotate(a = [90, -90, 90]) {
		translate([-plate_height/6, plate_width/6, 0])
			cylinder(r = mount_dia/2, h = plate_thickness + 1, center = true);
		translate([-plate_height/6, -plate_width/6, 0])
			cylinder(r = mount_dia/2, h = plate_thickness + 1, center = true);
		translate([plate_height/6, 0, 0])
			cylinder(r = mount_dia/2, h = plate_thickness + 1, center = true);
	}
}

/*
 * Actual keel plate with rounded corners.
 */
module base_plate()
{
	union() {
		cube([plate_length - bend_radius * 2, plate_width, plate_thickness], center = true);
		translate([-(plate_length - plate_thickness)/2, 0, (plate_height - plate_thickness + bend_radius)/2])
			cube([plate_thickness, plate_width, plate_height - bend_radius], center = true);
		translate([(plate_length - plate_thickness)/2, 0, (plate_height - plate_thickness + bend_radius)/2])
			cube([plate_thickness, plate_width, plate_height - bend_radius], center = true);
		translate([plate_length/2 - bend_radius, 0, bend_radius - plate_thickness/2])
			rotate(a = [-90, 0, 0])
				plate_bend();
		translate([-(plate_length/2 - bend_radius), 0, bend_radius - plate_thickness/2])
			rotate(a = [-90, 90, 0])
				plate_bend();
	}
}

/*
 * Actual keel plate with flat corners.
 */
module straight_plate()
{
	union() {
		cube([plate_length, plate_width, plate_thickness], center = true);
		translate([-(plate_length - plate_thickness)/2, 0, (plate_height - plate_thickness)/2])
			cube([plate_thickness, plate_width, plate_height], center = true);
		translate([(plate_length - plate_thickness)/2, 0, (plate_height - plate_thickness)/2])
			cube([plate_thickness, plate_width, plate_height], center = true);
	}
}

/*
 * Actual keel plate.
 */
module keel_plate()
{
	difference() {
		base_plate();
		/*
		 * Keel bolts...
		 */
		translate([keelbolt_sep/2, 0, 0])
			cylinder(r = keelbolt_dia/2, h = plate_thickness + 1, center = true);
		translate([-keelbolt_sep/2, 0, 0])
			cylinder(r = keelbolt_dia/2, h = plate_thickness + 1, center = true);
		/*
		 * Mounting holes...
		 */
		translate([(plate_length - plate_thickness)/2, 0, (plate_height - plate_thickness)/2])
			mounting_holes();
		translate([-(plate_length - plate_thickness)/2, 0, (plate_height - plate_thickness)/2])
			mounting_holes();
	}
}

if (0) {
	projection(cut = false) {
		union() {
			/* Plan view */
			translate([0, 0, -plate_thickness/2]) keel_plate();
			/* Front Profile view */
			translate([0, plate_width/1.5 + plate_height, -10]) rotate(a = [90, 0, 0]) keel_plate();
			/* Left Profile view */
			translate([plate_length/1.5, 0, (plate_length - plate_thickness)/2]) rotate(a = [0, 90, 0]) keel_plate();
		}
	}
} else {
	keel_plate();
}