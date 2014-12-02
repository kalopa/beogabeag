module naca0009(chord, height)
{
  hull() {
    translate([0.000000 * chord,0,0]) cylinder(r = 0.000000 * chord, h = height);
    translate([0.012500 * chord,0,0]) cylinder(r = 0.014204 * chord, h = height);
    translate([0.025000 * chord,0,0]) cylinder(r = 0.019610 * chord, h = height);
    translate([0.050000 * chord,0,0]) cylinder(r = 0.026660 * chord, h = height);
    translate([0.075000 * chord,0,0]) cylinder(r = 0.031499 * chord, h = height);
    translate([0.100000 * chord,0,0]) cylinder(r = 0.035121 * chord, h = height);
    translate([0.150000 * chord,0,0]) cylinder(r = 0.040089 * chord, h = height);
    translate([0.200000 * chord,0,0]) cylinder(r = 0.043032 * chord, h = height);
    translate([0.250000 * chord,0,0]) cylinder(r = 0.044559 * chord, h = height);
    translate([0.300000 * chord,0,0]) cylinder(r = 0.045013 * chord, h = height);
    translate([0.400000 * chord,0,0]) cylinder(r = 0.043523 * chord, h = height);
    translate([0.500000 * chord,0,0]) cylinder(r = 0.039705 * chord, h = height);
    translate([0.600000 * chord,0,0]) cylinder(r = 0.034225 * chord, h = height);
    translate([0.700000 * chord,0,0]) cylinder(r = 0.027479 * chord, h = height);
    translate([0.800000 * chord,0,0]) cylinder(r = 0.019673 * chord, h = height);
    translate([0.900000 * chord,0,0]) cylinder(r = 0.010858 * chord, h = height);
    translate([0.950000 * chord,0,0]) cylinder(r = 0.006049 * chord, h = height);
    translate([1.000000 * chord,0,0]) cylinder(r = 0.000945 * chord, h = height);
  }
}

naca0009(100, 3);
