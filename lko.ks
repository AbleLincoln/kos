// Low Kerbin Orbit

parameter apoap is 80000, ratio is 500, inclination is 90.

print "Initializing protocol LOW KERBIN ORBIT at " + apoap + "m".

lock throttle to 1.0.

when maxthrust = 0 then {
  wait 0.2.
  print "Staging".
  stage.
  preserve.
}

lock steering to heading(inclination, 90).
until ship:apoapsis > apoap {
  if ship:velocity:surface:mag > 100 {
    lock steering to heading(inclination, max(90 - ship:altitude / ratio, 10 )).
  }
}

print "Cruising altitude reached".

lock throttle to 0.0.

print "Throttle shutdown".

run circularize.

print "Orbit achieved".

