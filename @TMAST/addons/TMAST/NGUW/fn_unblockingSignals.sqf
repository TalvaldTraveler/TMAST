player setVariable ["TMAST_GPSunderWater", false];
_uav = player getVariable "TMAST_ConnectedUav";
player connectTerminalToUAV _uav;
player setVariable ["TMAST_ConnectedUav", nil];

[{(eyePos player select 2) < -0.5}, {call NGUW_fnc_blockingSignals;}] call CBA_fnc_waitUntilAndExecute;