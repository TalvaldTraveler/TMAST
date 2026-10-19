private _hacker = objNull;
if !(_this isEqualTo []) then {_hacker = _this select 0;};
if (isNull _hacker) exitWith { systemChat "No spoofer object was given.";};

private _side = param [1, allPlayers, [sideUnknown, grpNull, objNull,[]],[]];
private _size = param [2, 2500, [0],1];
private _active = param [3, true, [true],1];
private _switch = param [4, false, [true],1];
private _hackedTarget = param [5, _hacker, [objNull], 1]; 
private _dynamic = param [6, false, [true],1];

if (_active) then {
	_count = count allMapMarkers;
	_mrkName = ["HackingZone", _side, _count] joinString "_";
	_hacker setVariable ["TMAST_HackMarkerName", _mrkName, true];
	_marker = createMarkerLocal [_mrkName, position _hacker];
	_marker setMarkerShapeLocal "ELLIPSE";
	_marker setMarkerAlphaLocal 0;
	_marker setMarkerTypeLocal "Empty";
	_marker setMarkerSize [_size, _size];
	[_hacker, _marker, _hackedTarget] remoteExec ["TMAST_fnc_setUpHacker_hacking", _side, true];
	_hacker setVariable ["TMAST_Hacker_Active", true, true];
	if (_dynamic) then {
		[_hacker, _marker] call TMAST_fnc_moveZone;
	};
	[{!(alive (_this select 1))}, {deleteMarker (_this select 0);}, [_marker, _hacker]] call CBA_fnc_waitUntilAndExecute;
};

if (_switch) then {
	[_hacker, _side, _size, _hackedTarget, _dynamic] remoteExec ["TMAST_fnc_setUpHacker_startAction", allPlayers, true];
};

[_hacker] remoteExec ["TMAST_fnc_setUpHacker_stopAction", allPlayers, true];