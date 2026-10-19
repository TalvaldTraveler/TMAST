params ["_jammer"];

_jammer addAction
[
	"Turn off",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		_mrkName = _target getVariable "TMAST_HackMarkerName";
		deleteMarker _mrkName;
		_target setVariable ["TMAST_Hacker_Active", false, true];
	},
	nil,
	1.5,
	true,
	true,
	"",
	"!(!alive _target || !(_target getVariable ['TMAST_Hacker_Active', false]))",
	3,
	false,
	"",
	""
];