private _marker = "";
if !(_this isEqualTo []) then {_marker = _this select 0;};
if (markerShape _marker == "") exitWith {systemChat "No Marker was given.";};

private _signalshadow = param [1, true, [true],1];
private _multipathing = param [2, false, [true],1];
private _laggingInformation = param [3, [235,69]];
private _shifting = param [4, false, [true],1];
private _shiftingSec = param [5, 60, [0],1];
private _shadowWeight = param [6, 50, [0],1];
private _pathingWeight = param [7, 30, [0],1];
private _signalWeight = param [8, 20, [0],1];
private _altitude = param [9, 750, [0],1];
if (!(_signalshadow) && !(_multipathing)) exitWith {};

switch (true) do
{
	case (_signalshadow && _multipathing && _shifting): {[_marker, _laggingInformation, _shiftingSec, _shadowWeight, _pathingWeight, _signalWeight, _altitude] remoteExec ["TMAST_fnc_setUpSignalShadow_Shifting", allPlayers, true];};
	case (_signalshadow && _multipathing): {[_marker, _laggingInformation, _shiftingSec, _shadowWeight, _pathingWeight, 0, _altitude] remoteExec ["TMAST_fnc_setUpSignalShadow_Shifting", allPlayers, true];};
	case (_signalshadow && _shifting): {[_marker, nil, _shiftingSec, _shadowWeight, 0, _signalWeight, _altitude] remoteExec ["TMAST_fnc_setUpSignalShadow_Shifting", allPlayers, true];};
	case (_signalshadow): {[_marker, _altitude] remoteExec ["TMAST_fnc_setUpSignalShadow_ShadowStrong", allPlayers, true];};
	case (_multipathing && _shifting): {[_marker, _laggingInformation, _shiftingSec, 0, _pathingWeight, _signalWeight, _altitude] remoteExec ["TMAST_fnc_setUpSignalShadow_Shifting", allPlayers, true];};
	case (_multipathing): {[_marker, _laggingInformation, _altitude] remoteExec ["TMAST_fnc_setUpSignalShadow_MultipathingStrong", allPlayers, true];};
	default {};
};