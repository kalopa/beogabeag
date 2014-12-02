/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * All dimensions are in mm.
 */

wall_thickness = 2;

cap_radius = 25;
cap_height = 24;
inner_radius = 14;
screw_post_radius = 3;

gland_position = -10;

wind_shaft_diameter = 4.5;
bearing_height = 5;
bearing_diameter = 13.2;

mast_diameter = 8.1;
mast_collar_length = 20;

rg_angle = 112.5;

/*
 * Define the top/bottom end cap for the piece. The shaft radius is used to specify if the end cap has a shaft hole.
 */
module end_cap(shaft_radius)
{
	union() {
		/*
		 * End Cap
		 */
		if (shaft_radius > 0) {
			difference() {
				color([0.3, 0, 1]) cylinder(r = cap_radius, h = wall_thickness, center = true);
				cylinder(r = shaft_radius, h = wall_thickness + 1, center = true, $fn = 12);
			}
		} else {
			color([0.3, 0, 1]) cylinder(r = cap_radius, h = wall_thickness, center = true);
		}
		/*
		 * Ridge around the end cap.
		 */
		translate([0, 0, wall_thickness / 2])
			difference() {
				color([0.3, 0, 1]) cylinder(r = cap_radius, h = wall_thickness, center = true);
				cylinder(r = cap_radius - 1, h = wall_thickness + 1, center = true);
			}
	}
}

/*
 * Screw holes for mounting to top section...
 */
module m3_screw_hole()
{
	translate([0, inner_radius - screw_post_radius + 3.3/2, 0])
		cylinder(r = 3.2/2, h = wall_thickness + 1, center = true, $fn = 12);
}

module screw_holes()
{
	m3_screw_hole();
	rotate(a = [0, 0, rg_angle])
		m3_screw_hole();
	rotate(a = [0, 0, -rg_angle])
		m3_screw_hole();
}

