/*
 *
 */
use <../MCAD/involute_gears.scad>

/*
module gear (
	number_of_teeth=15,
	circular_pitch=false, diametral_pitch=false,
	pressure_angle=28,
	clearance = 0.2,
	gear_thickness=5,
	rim_thickness=8,
	rim_width=5,
	hub_thickness=10,
	hub_diameter=15,
	bore_diameter=5,
	circles=0,
	backlash=0,
	twist=0,
	involute_facets=0,
	flat=false)
*/


module big_gear()
{
	difference() {
		union() {
			intersection() {
				gear(number_of_teeth=48, circular_pitch = 300, bore_diameter=0, hub_thickness=8, gear_thickness=8, rim_thickness=8);
				translate([-2, -2, 0]) cube([200, 200, 10]);
			}
			translate([0, 0, 8]) cylinder(r = 15, h = 16, center = true);
			translate([2, 14, 4]) rotate(a = [0, 0, 70]) cube([40, 20, 8], center = true);
			translate([14, 2, 4]) rotate(a = [0, 0, 20]) cube([40, 20, 8], center = true);
		}
		cylinder(r = 7/2, h = 50, center = true);
		translate([-6, -6, 10]) rotate(a = [90, 0, -45]) cube([5.75, 12, 3], center = true);
		translate([-7, -7, 8]) rotate(a = [90, 0, -45]) cylinder(r = 3.9/2, h = 20, center = true);
	}
}

big_gear();
