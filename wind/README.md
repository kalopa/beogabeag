Masthead Wind Direction Indicator
=================================

These are the SCad files for building the masthead wind direction
indicator and the tricolour light.

The unit is in three parts. The main component has a top end-cap with a
5mm hole for the wind direction shaft. The wind direction arrow should
be a 4mm solid bronze shaft (solid) with a flat edge on one side for
the twin potentiometers. Just underneath the end cap is a 624 sealed
ball bearing. After this is a shaft collar, which prevents the shaft
from being pulled out of the unit. Under this are a pair of 2K5 low
torque potentiometers, which are mounted "out of phase." One is mounted
upside down and on top of the other. Make sure that the two pots are
180 degrees out of phase also so that the three pins on one are on the
opposite side to the three pins on the other. This means that one or
other pot will always provide a reading. This unit also houses the three
LEDs, which should be red, green and white. You will notice a small
arrow which indicates where the front of the unit is. This component is in
the file wdi_top.scad.

The pots are mounted in the second printable component, which is in
the file wdi_mount.scad. It also has an end-cap which seals the unit.

The third component is the mast base. It is in the file wdi_base.scad. The
base fits over an 8mm carbon fibre tube, and can be glued or epoxied
in place.
