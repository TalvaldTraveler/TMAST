player setVariable ["TMAST_GPSunderWater", true];

_uav = getConnectedUAV player;
player setVariable ["TMAST_ConnectedUav", _uav];
player connectTerminalToUAV objNull;

[{(eyePos player select 2) > 0}, {call NGUW_fnc_unblockingSignals;} ] call CBA_fnc_waitUntilAndExecute;