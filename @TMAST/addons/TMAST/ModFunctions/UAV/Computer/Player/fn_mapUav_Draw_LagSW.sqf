params ["_map", "_uav"];

_icon = getText (configFile >> "CfgVehicles" >> typeOf _uav >> "icon");
_laggingInformation = player getVariable ["TMAST_GPSShadowData", [1337,69]];
_laggingLocation = _uav getPos _laggingInformation;
_dir = direction _uav;
	
_map drawIcon [
	_icon,
	TMAST_PlayerColour,
	_laggingLocation,
	25,
	25,
	_dir,
	"",
	1,
	0.03,
	"TahomaB",
	"right"
];
