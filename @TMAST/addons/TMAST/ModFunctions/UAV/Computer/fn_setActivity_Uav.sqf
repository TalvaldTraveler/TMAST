_condition = _this select 0;
_connectedUav = getConnectedUAV player;
if (isNull _connectedUav) exitWith {};

if (_condition) then {
	player connectTerminalToUAV objNull;
	if (false == waypointsEnabledUAV _connectedUav) exitWith {};
	[_connectedUav, false] remoteExec ["enableUAVWaypoints", 0];
	[_connectedUav, false] remoteExec ["setAutonomous", 0];
} else {
	if (true == waypointsEnabledUAV _connectedUav) exitWith {};
	[_connectedUav, true] remoteExec ["enableUAVWaypoints", 0];
	[_connectedUav, true] remoteExec ["setAutonomous", 0];
};