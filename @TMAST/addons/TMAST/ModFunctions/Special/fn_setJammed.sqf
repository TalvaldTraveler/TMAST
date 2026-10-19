params ["_mrkName"];

if (!(player getVariable ["TMAST_GPSjammed", false])) 
then {
	player setVariable ["TMAST_GPSjammed", true, true];
	[{!(player inArea (_this select 0))}, {player setVariable ["TMAST_GPSjammed", false, true];}, [_mrkName]] call CBA_fnc_waitUntilAndExecute;
}
else {
};