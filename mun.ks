run once burntime.

// move origin to Kerbin
set shipPosition to V(0,0,0) - body:position.
set munPosition to MUN:position - body:position.

// Hohmann transfer orbit period
set apof to mun:altitude + kerbin:radius - mun:soiradius / 2.
set smaf to (apof + periapsis + kerbin:radius) / 2.
set periodf to 2 * constant:pi * sqrt(smaf^3 / kerbin:mu).

print "Hohmann apoapsis: " + round(apof/1000) + "km, transfer time: " + round(periodf/120) + "min".

// current target angular position
set am0 to arctan2(munPosition:x, munPosition:z).

// position after transfer
set deltaAngularM to (periodf / 2) / mun:obt:period * 360.
set amf to am0 - deltaAngularM. // counterclockwise orbits

// current ship angular position
set asnow to arctan2(shipPosition:x, shipPosition:z).
// ship angular position for maneuver
set as0 to mod(amf + 180, 360). // remember, counterclockwise
// make sure its in front of us
set asnode to as0.
until asnow > asnode { set asnode to asnode - 360. }
set etanode to (asnow - asnode) / 360 * ship:obt:period.

// hohmann orbit properties
set v0 to VELOCITYAT(SHIP, TIME:SECONDS + etanode):ORBIT:MAG.
set vf to sqrt( kerbin:mu * (2 / (periapsis + kerbin:radius) - 1 / smaf) ).
set deltav to vf - v0.
print "apof " + apof.
print "smaf " + smaf.
print "v0 " + v0.
print "vf " + vf.
print "deltaV: " + deltaV.

// its happening to soon
set tburn to burntime(deltaV).
if etanode < tburn { 
  set etanode to etanode + ship:obt:period. // advance one
}

// set up node
set n to node(time:seconds + etanode, 0, 0, deltaV).
add n.

print round(tburn) + " second burn in " + round(etanode) + " seconds".

run burn.


