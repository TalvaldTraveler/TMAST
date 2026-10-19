params [["_logic", objNull, [objNull]], ["_syncedObjects", [], [[]]]];
if (isNull _logic) exitWith {systemChat "Error!";};

private _spoofer = objNull;
if !(_syncedObjects isEqualTo []) then {_spoofer = _syncedObjects select 0;};
if (isNull _spoofer) exitWith { systemChat "No spoofer object synchronized to module.";};

private _sideSetting = _logic getVariable [ "Side", "ALLPLAYERS"];
private _size = _logic getVariable [ "Size", 2500];
private _active = _logic getVariable [ "Active", true];
private _switch = _logic getVariable ["Switch", false];
private _spoofedDistance = _logic getVariable ["Distance", 313]; 
private _spoofedAngle = _logic getVariable ["Angle", 67]; 
private _customPlayers = _logic getVariable ["CustomPlayers","[]"];
private _dynamic = _logic getVariable ["Moveable", false];

private _spoofedData = [_spoofedDistance, _spoofedAngle];

private _side = switch (_sideSetting) do {
    case "WEST": { west };
    case "EAST": { east };
    case "GUER": { independent };
    case "CIV":  { civilian };
    case "CUSTOM": {call compile _customPlayers};
    default {allPlayers};
};

if (_sideSetting isEqualTo "CUSTOM") then {
	if !(_side isEqualType []) exitWith {
        systemChat "CustomPlayers must be an array.";
    };
};

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