/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * Outline of 3382H-1-252 rotary sensor.
 *
 * All dimensions are in mm.
 */
module rotary_sensor()
{
	union() {
		/* Pot */
		difference() {
			translate([0, 0.5, 0])
				cube([11, 12, 2.9], center = true);
			cylinder(r = 2, h = 3, center = true, $fn = 12);
		}
		/* Pins */
		translate([0, -6.4, -2.0]) 
			cylinder(r = 0.38, h = 4, center = true);
		translate([0, 6.4, -2.0]) 
			cylinder(r = 0.38, h = 4, center = true);
		translate([-2.5, 6.4, -2.0]) 
			cylinder(r = 0.38, h = 4, center = true);
		translate([2.5, 6.4, -2.0]) 
			cylinder(r = 0.38, h = 4, center = true);
	}
}

rotary_sensor();
