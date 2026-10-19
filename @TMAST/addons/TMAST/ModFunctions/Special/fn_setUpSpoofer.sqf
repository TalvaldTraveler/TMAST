private _spoofer = objNull;
if !(_this isEqualTo []) then {_spoofer = _this select 0;};
if (isNull _spoofer) exitWith { systemChat "No spoofer object was given.";};

private _side = param [1, allPlayers, [sideUnknown, grpNull, objNull,[]],[]];
private _size = param [2, 2500, [0],1];
private _active = param [3, true, [true],1];
private _switch = param [4, false, [true],1];
private _spoofedData = param [5, [313,67]]; 
private _dynamic = param [6, false, [true],1];

if (_active) then {
	_count = count allMapMarkers;
	_mrkName = ["SpoofingZone", _side, _count] joinString "_";
	_spoofer setVariable ["TMAST_SpoofMarkerName", _mrkName, true];
	_marker = createMarkerLocal [_mrkName, position _spoofer];
	_marker setMarkerShapeLocal "ELLIPSE";
	_marker setMarkerAlphaLocal 0;
	_marker setMarkerTypeLocal "Empty";
	_marker setMarkerSize [_size, _size];
	[_spoofer, _marker, _spoofedData] remoteExec ["TMAST_fnc_setUpSpoofer_spoofing", _side, true];
	_spoofer setVariable ["TMAST_Spoofer_Active", true, true];
	if (_dynamic) then {
		[_spoofer, _marker] call TMAST_fnc_moveZone;
	};
	[{!(alive (_this select 1))}, {deleteMarker (_this select 0);}, [_marker, _spoofer]] call CBA_fnc_waitUntilAndExecute;
};

if (_switch) then {
	[_spoofer, _side, _size, _spoofedData, _dynamic] remoteExec ["TMAST_fnc_setUpSpoofer_startAction", allPlayers, true];
};

[_spoofer] remoteExec ["TMAST_fnc_setUpSpoofer_stopAction", allPlayers, true];