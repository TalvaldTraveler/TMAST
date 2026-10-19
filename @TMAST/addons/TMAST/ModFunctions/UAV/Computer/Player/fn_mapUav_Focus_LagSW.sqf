params ["_map"];

_uav = getConnectedUAV player;
if (isNull _uav) exitWith {};
_laggingInformation = player getVariable ["TMAST_GPSShadowData", [1337,69]];
player setVariable ["TMAST_GPSShadowData", _laggingInformation];
_laggingLocation = _uav getPos _laggingInformation;
	
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
		case (_x select 1 > 1): {[_map, waypointPosition [driver _uav, (_x select 1)-1], waypointPosition _x, Player, "TMAST_GPSShadowData"] call TMAST_fnc_uavWaypoint};
		case (_x select 1 == 1): {[_map, getPos _uav, waypointPosition _x, Player, "TMAST_GPSShadowData"] call TMAST_fnc_uavWaypoint};
		case (_x select 1 == 0): {};
	};
} forEach _waypoints;
