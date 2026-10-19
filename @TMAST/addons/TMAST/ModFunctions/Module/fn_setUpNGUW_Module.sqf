if (isNull player) exitWith {};

[{(eyePos player select 2) < -0.5}, {call NGUW_fnc_blockingSignals;}] call CBA_fnc_waitUntilAndExecute;