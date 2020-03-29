run once burntime.

print "nyaaaa".
set burn to nextNode.

set deltaV to burn:deltav:mag.

set deltaT to burntime(deltaV).

print "Burntime is " + deltaT.

lock steering to burn:deltav.

print "eta is " + burn:eta.

// set timeToBurn to burn:eta - deltaT / 2.
// warpTo(time:seconds + timeToBurn - 10).
wait burn:eta - deltaT / 2.

lock throttle to 1.0.

wait deltaT.

lock throttle to 0.0.

print "maneuver completed".