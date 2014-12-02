/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * All dimensions are in mm.
 */

/*
 * Create a buttress to reinforce a vertical column.
 * The height and length specify how high and how far out the
 * buttress goes, and the width is the width of the thing.
 */
module buttress(height, length, width)
{
	phi = atan(length / height);
	cx = length / sin(phi);
	cy = length / cos(phi);
	intersection() {
		rotate(a = [90, 90 - phi, 0])
			cube([cx, cy, width], center = true);
		translate([length/2, 0, cy*sin(phi)/2])
			cube([length, width + 2, height], center = true);
	}
}

buttress(25, 10, 2);
