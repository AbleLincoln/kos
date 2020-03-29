lock throttle to 1.0.

when maxthrust = 0 and stage:number > 0 then {
  wait 0.2.
  print "Staging".
  stage.
  preserve.
}

when altitude > 59000 and altitude < 68000 and ship:velocity:surface:mag > 1630 and ship:velocity:surface:mag < 1950 then {
  CORE:PART:GETMODULE("heaty"):DOEVENT("Run Test").
}

until altitude > 60000 and ship:velocity:surface:mag > 1700 {
  lock steering to heading(90, 90).
}

lock throttle to 0.

