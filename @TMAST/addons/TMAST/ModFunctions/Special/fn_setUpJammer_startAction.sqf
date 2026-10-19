params ["_jammer", "_side", "_size", "_dynamic"];

_jammer addAction
[
	"Turn on",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		_sideArg = _arguments select 0;
		_sizeArg = _arguments select 1;
		_dynArg = _arguments select 2;
		_mrkName = ["JammingZone", time] joinString "_";
		_target setVariable ["TMAST_JamMarkerName", _mrkName, true];
		_marker = createMarkerLocal [_mrkName, position _target];
		_marker setMarkerShapeLocal "ELLIPSE";
		_marker setMarkerAlphaLocal 0;
		_marker setMarkerTypeLocal "Empty";
		_marker setMarkerSize [_sizeArg, _sizeArg];
		[_target, _marker] remoteExec ["TMAST_fnc_setUpJammer_jamming", _sideArg, true];
		_target setVariable ["TMAST_Jammer_Active", true, true];
		if (_dynArg) then {
			[_target, _marker] remoteExec ["TMAST_fnc_moveZone", 2];
		};
		[{!(alive (_this select 1))}, {deleteMarker (_this select 0);}, [_marker, _target]] call CBA_fnc_waitUntilAndExecute;
	},
	[_side, _size, _dynamic],
	1.5,
	true,
	true,
	"",
	"!(!alive _target || (_target getVariable ['TMAST_Jammer_Active', false]))",
	3,
	false,
	"",
	""
];