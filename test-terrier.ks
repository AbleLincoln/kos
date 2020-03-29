lock steering to prograde.

wait 1.

stage.

local isFinished is false.

lock throttle to 1.

// on velocity:surface:mag {
//   if velocity:surface:mag > 380  {
//     lock throttle to 0.75.
//   }
//   else if velocity:surface:mag < 340 {
//     lock throttle to 1.0.
//   }
//   preserve.
// }

when apoapsis > 71000 then {
  lock throttle to 0.
}

when altitude > 66000 and velocity:surface:mag < 400 and velocity:surface:mag > 320 then {
  stage.
  set isFinished to true.
}

wait until isFinished = true.

