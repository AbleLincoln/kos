// Circularize

parameter down is false.

run once burntime.

print "Circularizing...".

if down {
  set apsis to periapsis.
} else {
  set apsis to apoapsis.
}

// speed at apoapsis: Vap = sqrt(((1 - e) * mu)/Ra)
// eccentricity is 0
set vf to sqrt( SHIP:OBT:BODY:MU / (apsis + SHIP:OBT:BODY:RADIUS) ).

print "targetV " + vf.

// current speed at apoap
// square_root(mu * (2/altitude - 1/semimajor_axis))
// local currentV is sqrt( SHIP:OBT:BODY:MU * ( 2 / apoapsis - 1 / orbit:semimajoraxis ) ).
if down {
  set apsiseta to time:seconds + eta:periapsis.
} else {
  set apsiseta to time:seconds + eta:apoapsis.
}

set v0 to VELOCITYAT(SHIP, apsiseta):ORBIT:MAG.

print  "currentV " + v0.

// calculate burn
set deltaV to vf - v0.

print "deltaV " + deltaV.

// make maneuver node
local node is NODE(apsiseta, 0, 0, deltaV).
add node.

run burn.

// UNTIL eta:apoapsis < deltaT / 2 {
//   lock steering to node:burnvector.
// }

// lock throttle to 1.0.

// UNTIL orbit:eccentricity < 0.1 and periapsis > 0 {
//   lock steering to node:burnvector.
// }

// lock throttle to 0.

print "Circularized.".