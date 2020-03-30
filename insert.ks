parameter targetApoap.
parameter targetPeriap.
parameter targetInclination.
parameter targetLAN. // longitude of ascending node
parameter targetArgPe. // argument of periapsis

run once burntime.

// match longitude of ascending node

set rotation to ship:longitude + kerbin:rotationangle.
set deltaRot to targetLAN - rotation.
if (deltaRot < 0) { set deltaRot to deltaRot + 360. }
set etaLong to deltaRot * kerbin:rotationperiod / 360.

warpTo(time:seconds + etaLong - 20).
wait etaLong.

// heading towards the target inclination

set roomforerror to targetInclination * 0.1.
run lko (80000, 500, 90 - targetInclination - roomforerror). // 5 for error margin 

stage. // TODO: remove

// TODO: remove
// orbital inclination change
// set deltaLong to omega - ship:longitude + 180.
// set etaLong to time:seconds + ship:obt:period * deltaLong / 360.
// set v0 to VELOCITYAT(SHIP, etaLong):ORBIT:MAG.
// set deltaVi to 2 * v0 * sin(inclination / 2).

// match argument of periapsis
// match apoapsis
// lock long to ship:longitude + kerbin:rotationangle.
// warpTo(time:seconds + ship:obt:period). // go around once (sometimes you have to another time manually)
// wait until abs(targetLAN - long) < 0.1. // to find our ascending node

set etaAsc to eta:periapsis - ship:obt:period * ship:obt:argumentofperiapsis / 360.
if etaAsc < 0 { set etaAsc to etaAsc + ship:obt:period. }
set etaburn to etaAsc + ship:obt:period * targetArgPe / 360.

// calculate dv for apoap
set v0 to VELOCITYAT(SHIP, time:seconds + etaburn):ORBIT:MAG.
print "v0 " + v0.
set smaf to (targetApoap + kerbin:radius + altitude + kerbin:radius) / 2.
set vaf to sqrt( KERBIN:MU * ( 2 / (altitude + kerbin:radius) - 1 / smaf )).
print "vaf " + vaf.
set deltaV to vaf - v0.
print "deltaV " + deltaV.

if etaburn < burntime(deltaV) { set etaburn to etaburn + ship:obt:period. }

local nd1 is NODE(time:seconds + etaburn, 0, 0, deltaV).
add nd1.

wait 0.5.

run burn.

wait 0.5.

// change periap
print "bringing up periap".

set v0 to VELOCITYAT(SHIP, time:seconds + eta:apoapsis):ORBIT:MAG.
print "v0 " + v0.
set smaf to (ship:apoapsis + kerbin:radius + targetPeriap + kerbin:radius) / 2.
set vaf to sqrt( KERBIN:MU * ( 2 / (ship:apoapsis + kerbin:radius) - 1 / smaf )).
print "vaf " + vaf.
set deltaV to vaf - v0.
print "deltaV " + deltaV.

local nd2 is NODE(time:seconds + eta:apoapsis, 0, 0, deltaV).
add nd2.

wait 0.5.

run burn.

wait 0.5.

// correction burns

// correct apoapsis

// set etaburn to time:seconds + eta:periapsis.

// set v0 to VELOCITYAT(SHIP, etaburn):ORBIT:MAG.
// print "v0 " + v0.
// set smaf to (targetApoap + kerbin:radius + ship:periapsis + kerbin:radius) / 2.
// set vaf to sqrt( KERBIN:MU * ( 2 / (ship:periapsis + kerbin:radius) - 1 / smaf )).
// print "vaf " + vaf.
// set deltaV to vaf - v0.
// print "deltaV " + deltaV.

// local nd3 is NODE(etaburn, 0, 0, deltaV).
// add nd3.

// wait 0.5.

// run burn.

// wait 0.5.

// // correct periapsis

// set etaburn to time:seconds + eta:apoapsis.

// set v0 to VELOCITYAT(SHIP, etaburn):ORBIT:MAG.
// set v0 to sqrt( KERBIN:MU * ( 2 / (targetApoap + kerbin:radius) - 1 / smaf )).
// print "v0 " + v0.
// set smaf to (targetApoap + kerbin:radius + targetPeriap + kerbin:radius) / 2.
// set vaf to sqrt( KERBIN:MU * ( 2 / (targetApoap + kerbin:radius) - 1 / smaf )).
// print "vaf " + vaf.
// set deltaV to vaf - v0.
// print "deltaV " + deltaV.

// local nd4 is NODE(etaburn, 0, 0, deltaV).
// add nd4.

// wait 0.5.

// run burn.

// wait 0.5.


print "complete".
print "make corrections if you need to".