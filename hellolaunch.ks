CLEARSCREEN.

lock throttle to 1.0.

// print "Counting down...".
// from {local countdown is 10.} until countdown = 0 step {set countdown to countdown - 1.} do {
//   print "..." + countdown.
//   wait 1.
// }

when maxthrust = 0 and stage:number > 1 then {
  print "Staging".
  stage.
  preserve.
}

set mysteer to heading(90, 90).
lock steering to mysteer.
until ship:apoapsis > 80000 {
  set myvelocity to ship:velocity:surface:mag.
  if ship:velocity:surface:mag > 100 {
    set mysteer to heading(90, max(90 - myvelocity / 20, 0 )).
  }
}