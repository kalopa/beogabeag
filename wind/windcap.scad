/*
 * Written by Dermot Tynan, Kalopa Research.
 * GPLv2.
 *
 * Cap to prevent water ingress into the WDI.
 *
 * All dimensions are in mm.
 */
wdi_shaft_dia = 7.8*1.15;
cap_inner_dia = 13*1.15;
cap_height = 20;
cap_thickness = 2;

module wind_cap()
{
	difference() {
		cylinder(r = cap_inner_dia / 2 + cap_thickness, h = cap_height + 10, center = true);
		translate([0, 0, -cap_thickness + 7.5]) cylinder(r = cap_inner_dia / 2, h = cap_height, center = true);
		cylinder(r = wdi_shaft_dia / 2, h = cap_height * 3, center = true);
	}
}

wind_cap();
