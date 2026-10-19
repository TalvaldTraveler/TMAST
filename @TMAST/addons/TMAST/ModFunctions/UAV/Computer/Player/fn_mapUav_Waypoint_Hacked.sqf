params ["_map", "_frompos", "_topos", "_spoofedLocation", "_uav"];

_dist = (getPos _uav) distance _spoofedLocation;
_dir = (getPos _uav) getDir _spoofedLocation;
_spoofedfrompos = _frompos getPos [_dist, _dir];
_spoofedtopos = _topos getPos [_dist, _dir];

_map drawArrow [
	_spoofedfrompos,
	_spoofedtopos,
	TMAST_PlayerColour
];