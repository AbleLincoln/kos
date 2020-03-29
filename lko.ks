// Low Kerbin Orbit

parameter apoap is 80000, ratio is 500.

CLEARSCREEN.

print "Initializing protocol LOW KERBIN ORBIT" .

lock throttle to 1.0.

when maxthrust = 0 then {
  wait 0.2.
  print "Staging".
  stage.
  preserve.
}

lock steering to heading(90, 90).
until ship:apoapsis > apoap {
  if ship:velocity:surface:mag > 100 {
    lock steering to heading(90, max(90 - ship:altitude / ratio, 10 )).
    print "Pitched: " + ship:facing:pitch AT (0, 3).
  }
}

print "Cruising altitude reached".

lock throttle to 0.0.

print "Throttle shutdown".

run circularize.

print "Orbit achieved".

