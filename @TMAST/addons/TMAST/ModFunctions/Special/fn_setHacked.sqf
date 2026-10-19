params ["_mrkName", "_hackedTarget"];

if (!((player getVariable ["TMAST_GPShacked", false]) isEqualTo "TargSpoofing")) 
then {
	player setVariable ["TMAST_GPShacked", "TargSpoofing", true];
	player setVariable ["TMAST_GPSHackedData", _hackedTarget, true];
	[{!(player inArea (_this select 0))}, {player setVariable ["TMAST_GPShacked", nil, true];}, [_mrkName]] call CBA_fnc_waitUntilAndExecute;
}
else {
};