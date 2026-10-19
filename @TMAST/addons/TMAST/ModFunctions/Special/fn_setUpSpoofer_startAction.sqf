params ["_spoofer", "_side", "_size", "_spoofedData", "_dynamic"];

_spoofer addAction
[
	"Turn on",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		_sideArg = _arguments select 0;
		_sizeArg = _arguments select 1;
		_dataArg = _arguments select 2;
		_dynArg = _arguments select 3;
		_mrkName = ["SpoofingZone", time] joinString "_";
		_target setVariable ["TMAST_SpoofMarkerName", _mrkName, true];
		_marker = createMarkerLocal [_mrkName, position _target];
		_marker setMarkerShapeLocal "ELLIPSE";
		_marker setMarkerAlphaLocal 0;
		_marker setMarkerTypeLocal "Empty";
		_marker setMarkerSize [_sizeArg, _sizeArg];
		[_target, _marker, _dataArg] remoteExec ["TMAST_fnc_setUpSpoofer_spoofing", _sideArg, true];
		_target setVariable ["TMAST_Spoofer_Active", true, true];
		if (_dynArg) then {
			[_target, _marker] remoteExec ["TMAST_fnc_moveZone", 2];
		};
		[{!(alive (_this select 1))}, {deleteMarker (_this select 0);}, [_marker, _target]] call CBA_fnc_waitUntilAndExecute;
	},
	[_side, _size, _spoofedData, _dynamic],
	1.5,
	true,
	true,
	"",
	"!(!alive _target || (_target getVariable ['TMAST_Spoofer_Active', false]))",
	3,
	false,
	"",
	""
];