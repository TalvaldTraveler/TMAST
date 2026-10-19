params [["_logic", objNull, [objNull]]];
if (isNull _logic) exitWith {systemChat "Error!";};

private _marker = _logic getVariable [ "MarkerName", ""];
if (markerShape _marker == "") exitWith {systemChat "No Marker was given.";};

private _signalshadow = _logic getVariable [ "ShadowActive", "true"];
private _multipathing = _logic getVariable [ "MultipathingActive", "false"];
private _shifting = _logic getVariable [ "ShiftingActive", "false"];
private _shiftingSec = _logic getVariable [ "ShiftingSec", 60];
private _pathingDistance = _logic getVariable ["Distance", 235]; 
private _pathingAngle = _logic getVariable ["Angle", 69]; 
private _laggingInformation = [_pathingDistance, _pathingAngle];
private _shadowWeight = _logic getVariable ["ShadowWeight", 50]; 
private _pathingWeight = _logic getVariable ["PathingWeight", 30]; 
private _signalWeight = _logic getVariable ["SignalWeight", 20]; 
private _altitude = _logic getVariable ["Altitude", 750]; 

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