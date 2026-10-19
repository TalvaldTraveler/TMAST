params ["_map"];

_uav = getConnectedUAV player;
if (isNull _uav) exitWith {};
_icon = getText (configFile >> "CfgVehicles" >> typeOf _uav >> "icon");
_laggingInformation = _uav getVariable ["TMAST_GPSSscintillationData", [670,67]];
_uav setVariable ["TMAST_GPSSscintillationData", _laggingInformation, true];
_laggingLocation = _uav getPos _laggingInformation;
_dir = (floor direction _uav)-10;
	
_map drawIcon [
	_icon,
	TMAST_PlayerColour,
	_laggingLocation,
	25,
	25,
	_dir,
	"",
	1,
	0.03,
	"TahomaB",
	"right"
];
	
_map drawEllipse [
	_laggingLocation, 
	24, 
	24, 
	0, 
	TMAST_PlayerColour, 
	""
];

_waypoints = [];
{
	_waypoints pushBack _x;
} forEach waypoints driver _uav;

{
	switch (true) do
	{
		case (_x select 1 > 1): {[_map, waypointPosition [driver _uav, (_x select 1)-1], waypointPosition _x, _uav, "TMAST_GPSShadowData"] call TMAST_fnc_uavWaypoint};
		case (_x select 1 == 1): {[_map, getPos _uav, waypointPosition _x, _uav, "TMAST_GPSSscintillationData"] call TMAST_fnc_uavWaypoint};
		case (_x select 1 == 0): {};
	};
} forEach _waypoints;
