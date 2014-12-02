/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * All dimensions are in mm.
 */

plate_width = 300;
plate_height = 240;
plate_thickness = 1.2;

M3_radius = 3.5/2;
M4_radius = 4.5/2;

/*
 * Mounting plate for the Sailboat Guidance System.
 */
module base_plate()
{
	translate([10, 10, 0]) {
		color("SlateGray") {
			minkowski() {
				cube([plate_width - 20, plate_height - 20, plate_thickness]);
				cylinder(r = 10, h = plate_thickness);
			}
		}
	}
}

/*
 * Screw hole.
 */
module screw_hole(x, y, size)
{
	translate([x, y, 1])
		cylinder(r = size, h = plate_thickness + 2, center = true, $fn = 20);
}

/*
 * Mounting holes...
 */
module mounting_holes()
{
	screw_hole(12, 12, M4_radius);
	screw_hole(plate_width/2, 10, M4_radius);
	screw_hole(plate_width-12, 12, M4_radius);
	screw_hole(13, plate_height-12, M4_radius);
	screw_hole(plate_width/2, plate_height-10, M4_radius);
	screw_hole(plate_width-12, plate_height-12, M4_radius);
}

/*
 * Actual SGS plate.
 */
module sgs_plate()
{
	difference() {
		base_plate();
		mounting_holes();
		/*
		 * Igor mounting holes...
		 */
		screw_hole(50, 40, M3_radius);
		screw_hole(139, 40, M3_radius);
		screw_hole(50, 154, M3_radius);
		screw_hole(139, 154, M3_radius);
		/*
		 * Otto mounting holes...
		 */
		screw_hole(161, 40, M3_radius);
		screw_hole(250, 40, M3_radius);
		screw_hole(161, 154, M3_radius);
		screw_hole(250, 154, M3_radius);
		/*
		 * Mother mounting holes...
		 */
		screw_hole(75, 52, M3_radius);
		screw_hole(225, 52, M3_radius);
		screw_hole(75, 142, M3_radius);
		screw_hole(225, 142, M3_radius);
		/*
		 * PSU mounting holes...
		 */
		screw_hole(140, 175, M3_radius);
		screw_hole(109, 186, M3_radius);
		screw_hole(200, 175, M3_radius);
		screw_hole(169, 186, M3_radius);
	}
}

module sgs_backing_plate()
{
	difference() {
		base_plate();
		mounting_holes();
		translate([20, 20, 0])
			cube([plate_width - 40, plate_height - 40, plate_thickness + 1]);
	}
}

projection(cut = true) sgs_plate();
