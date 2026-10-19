private _jammer = objNull;
if !(_this isEqualTo []) then {_jammer = _this select 0;};
if (isNull _jammer) exitWith { systemChat "No jammer object was given.";};

private _side = param [1, allPlayers, [sideUnknown, grpNull, objNull,[]],[]];
private _size = param [2, 2500, [0],1];
private _active = param [3, true, [true],1];
private _switch = param [4, false, [true],1];
private _dynamic = param [5, false, [true],1];

if (_active) then {
	_count = count allMapMarkers;
	_mrkName = ["JammingZone", _side, _count] joinString "_";
	_jammer setVariable ["TMAST_JamMarkerName", _mrkName, true];
	_marker = createMarkerLocal [_mrkName, position _jammer];
	_marker setMarkerShapeLocal "ELLIPSE";
	_marker setMarkerAlphaLocal 0;
	_marker setMarkerTypeLocal "Empty";
	_marker setMarkerSize [_size, _size];
	[_jammer, _marker] remoteExec ["TMAST_fnc_setUpJammer_jamming", _side, true];
	_jammer setVariable ["TMAST_Jammer_Active", true, true];
	if (_dynamic) then {
		[_jammer, _marker] call TMAST_fnc_moveZone;
	};
	[{!(alive (_this select 1))}, {deleteMarker (_this select 0);}, [_marker, _jammer]] call CBA_fnc_waitUntilAndExecute;
};

if (_switch) then {
	[_jammer, _side, _size, _dynamic] remoteExec ["TMAST_fnc_setUpJammer_startAction", allPlayers, true];
};

[_jammer] remoteExec ["TMAST_fnc_setUpJammer_stopAction", allPlayers, true];