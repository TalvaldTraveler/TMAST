params [["_logic", objNull, [objNull]], ["_syncedObjects", [], [[]]]];
if (isNull _logic) exitWith {systemChat "Error!";};

private _hacker = objNull;
if !(_syncedObjects isEqualTo []) then {_hacker = _syncedObjects select 0;};
if (isNull _hacker) exitWith{ systemChat "No spoofer object synchronized to module.";};

private _sideSetting = _logic getVariable [ "Side", "ALLPLAYERS"];
private _size = _logic getVariable [ "Size", 2500];
private _active = _logic getVariable [ "Active", true];
private _switch = _logic getVariable ["Switch", false];
private _hackedTarget = _logic getVariable ["Target", "_hacker"]; 
private _customPlayers = _logic getVariable ["CustomPlayers","[]"];
private _dynamic = _logic getVariable ["Moveable", false];

_hackedTarget = call compile _hackedTarget;
 
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