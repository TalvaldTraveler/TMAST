params ["_map", "_uav"];

_icon = getText (configFile >> "CfgVehicles" >> typeOf _uav >> "icon");
_spoofedInformation = player getVariable ["TMAST_GPSSpoofedData", [313,67]];
_spoofedLocation = _uav getPos _spoofedInformation;
_dir = direction _uav;
	
_map drawIcon [
	_icon,
	TMAST_PlayerColour,
	_spoofedLocation,
	25,
	25,
	_dir,
	"",
	1,
	0.03,
	"TahomaB",
	"right"
];
