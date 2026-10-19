params ["_map", "_frompos", "_topos", "_holder", "_variable"];

_errorInformation = _holder getVariable _variable;
_errorFromPos = _frompos getPos _errorInformation;
_errorToPos = _topos getPos _errorInformation;

_map drawArrow [
	_errorFromPos,
	_errorToPos,
	TMAST_PlayerColour
];