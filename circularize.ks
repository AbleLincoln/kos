// Circularize

parameter dir is "up".

if dir = "up" {
  set down to false.
} else {
  set down to true.
}

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

print "Circularized.".