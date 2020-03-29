CLEARSCREEN.

lock throttle to 1.0.

when maxthrust = 0 and stage:number > 2 then {
  print "Staging".
  stage.
  preserve.
}

set mysteer to heading(90, 90).
lock steering to mysteer.
until ship:apoapsis > 90000 {
  set myvelocity to ship:velocity:surface:mag.
  if myvelocity > 100 {
    set mysteer to heading(90, max(90 - ship:altitude / 500, 10 )).
  }
}

print "Cruising altitude reached".

lock throttle to 0.0.

print "Throttle shutdown".

print "Warping to apoap".

warpTo(time:seconds + eta:apoapsis - 2).

wait eta:apoapsis - 2.

print "We have reached apoap".

set mysteer to prograde.

wait 1.0.

lock throttle to 1.0.

// burn prograde to circulize
until ship:periapsis > 70000 {
  set mysteer to prograde.
}

lock throttle to 0.0.
