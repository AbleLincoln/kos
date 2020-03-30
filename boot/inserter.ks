wait 1.

copypath("archive:/lko", "").
copypath("archive:/circularize", "").
copypath("archive:/burntime","").
copypath("archive:/burn", "").
copypath("archive:/cat", "").
copypath("archive:/insert", "").

CORE:PART:GETMODULE("kOSProcessor"):DOEVENT("Open Terminal").

run insert(3366679, 2359989, 13, 142.1, 245.7).
