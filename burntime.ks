function burntime {
  parameter  dV.
  
  lock throttle to 0.

  set ispsum to 0.
  set maxthrustlimited to 0.
  LIST ENGINES in MyEngines.
  for engine in MyEngines {
      if engine:ISP > 0 {
          set ispsum to ispsum + (engine:MAXTHRUST / engine:ISP).
          set maxthrustlimited to maxthrustlimited + (engine:MAXTHRUST * (engine:THRUSTLIMIT / 100) ).
      }
  }
  set isp to ( maxthrustlimited / ispsum ).

  set eV to isp * CONSTANT:G0.

  unlock throttle.

  return mass * eV / maxthrustlimited * ( 1 - CONSTANT:E ^ (-1 * dv / eV ) ).

}