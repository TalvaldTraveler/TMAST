params ["_map", "_frompos", "_topos", "_uav"];

_spoofedInformation = _uav getVariable ["TMAST_GPSSpoofedData", [313,67]];
_spoofedfrompos = _frompos getPos _spoofedInformation;
_spoofedtopos = _topos getPos _spoofedInformation;

_map drawArrow [
	_spoofedfrompos,
	_spoofedtopos,
	TMAST_PlayerColour
];