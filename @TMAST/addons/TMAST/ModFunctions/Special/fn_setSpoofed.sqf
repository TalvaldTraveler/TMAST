params ["_mrkName", "_spoofedData"];

if (!((player getVariable ["TMAST_GPShacked", false]) isEqualTo "LocSpoofing")) 
then {
	player setVariable ["TMAST_GPShacked", "LocSpoofing", true];
	player setVariable ["TMAST_GPSSpoofedData", _spoofedData, true];
	[{!(player inArea (_this select 0))}, {player setVariable ["TMAST_GPShacked", nil, true];}, [_mrkName]] call CBA_fnc_waitUntilAndExecute;
}
else {
};