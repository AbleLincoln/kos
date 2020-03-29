local isFinished is false.

when maxthrust = 0 and stage:number > 2 then {
  print "Staging".
  stage.
  preserve.
}

lock throttle to 1.0.

lock steering to heading(90, 90).
until ship:apoapsis > 210000 {
  if ship:velocity:surface:mag > 100 {
    lock steering to heading(90, max(90 - ship:altitude / 1000, 10 )).
  }
}

when apoapsis > 200000 then {
  // lock throttle to 0.
}

when altitude > 180000 then {
  stage.
  set isFinished to true.
}

until isFinished = true.