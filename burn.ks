run once burntime.

set burn to nextNode.

set deltaV to burn:deltav:mag.

set deltaT to burntime(deltaV).

print "Burntime is " + deltaT.

lock steering to burn:deltav.

set dv0 to burn:deltav.

wait until burn:eta <= deltaT / 2.

lock throttle to 1.0.

wait until vdot(dv0, burn:deltav) < 0.

unlock throttle.
unlock steering.

// set throttle to 0 just in case.
SET SHIP:CONTROL:PILOTMAINTHROTTLE TO 0.

wait 1.

remove burn.

print "maneuver completed".