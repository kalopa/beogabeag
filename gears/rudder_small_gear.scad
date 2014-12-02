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
module small_gear()
{
	difference() {
		union() {
			intersection() {
				gear(number_of_teeth=14, circular_pitch = 300, bore_diameter=0, hub_thickness=8, gear_thickness=8, rim_thickness=8);
			}
			translate([0, 0, 8]) cylinder(r = 9, h = 16, center = true);
		}
		nema17_shaft();
		translate([0, -4.4, 13]) cube([5.75, 3.3, 10], center = true);
		translate([0, -7, 12]) rotate(a = [90, 0, 0]) cylinder(r = 3.9/2, h = 20, center = true);
	}
}

small_gear();
