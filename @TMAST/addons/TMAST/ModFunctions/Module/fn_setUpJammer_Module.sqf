params [["_logic", objNull, [objNull]], ["_syncedObjects", [], [[]]]];
if (isNull _logic) exitWith {systemChat "Error!";};

private _jammer = objNull;
if !(_syncedObjects isEqualTo []) then {_jammer = _syncedObjects select 0;};
if (isNull _jammer) exitWith { systemChat "No jammer object synchronized to module.";};

private _sideSetting = _logic getVariable [ "Side", "ALLPLAYERS"];
private _size = _logic getVariable [ "Size", 2500];
private _active = _logic getVariable [ "Active", true];
private _switch = _logic getVariable ["Switch", false];
private _customPlayers = _logic getVariable ["CustomPlayers","[]"];
private _dynamic = _logic getVariable ["Moveable", false];

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