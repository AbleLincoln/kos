print "~~~~ Going home ~~~~".

warpTo(time:seconds + eta:apoapsis - 10).

wait until eta:apoapsis < 10.

lock steering to retrograde.

wait until VANG(SHIP:FACING:VECTOR, retrograde:vector) < 2.

lock throttle to 1.0.

until periapsis < 50000 {
  lock steering to retrograde.
}

lock throttle to 0.0.

wait 1.

until stage:number = 0 {
  stage.
  wait 1.
}

print "Bye bye".