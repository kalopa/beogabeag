module naca0018(chord, height)
{
  hull() {
    translate([0.000000 * chord,0,0]) cylinder(r = 0.000000 * chord, h = height);
    translate([0.012500 * chord,0,0]) cylinder(r = 0.028409 * chord, h = height);
    translate([0.025000 * chord,0,0]) cylinder(r = 0.039221 * chord, h = height);
    translate([0.050000 * chord,0,0]) cylinder(r = 0.053320 * chord, h = height);
    translate([0.075000 * chord,0,0]) cylinder(r = 0.062999 * chord, h = height);
    translate([0.100000 * chord,0,0]) cylinder(r = 0.070242 * chord, h = height);
    translate([0.150000 * chord,0,0]) cylinder(r = 0.080177 * chord, h = height);
    translate([0.200000 * chord,0,0]) cylinder(r = 0.086063 * chord, h = height);
    translate([0.250000 * chord,0,0]) cylinder(r = 0.089119 * chord, h = height);
    translate([0.300000 * chord,0,0]) cylinder(r = 0.090026 * chord, h = height);
    translate([0.400000 * chord,0,0]) cylinder(r = 0.087045 * chord, h = height);
    translate([0.500000 * chord,0,0]) cylinder(r = 0.079410 * chord, h = height);
    translate([0.600000 * chord,0,0]) cylinder(r = 0.068451 * chord, h = height);
    translate([0.700000 * chord,0,0]) cylinder(r = 0.054959 * chord, h = height);
    translate([0.800000 * chord,0,0]) cylinder(r = 0.039347 * chord, h = height);
    translate([0.900000 * chord,0,0]) cylinder(r = 0.021716 * chord, h = height);
    translate([0.950000 * chord,0,0]) cylinder(r = 0.012098 * chord, h = height);
    translate([1.000000 * chord,0,0]) cylinder(r = 0.001890 * chord, h = height);
  }
}

naca0018(100, 3);
