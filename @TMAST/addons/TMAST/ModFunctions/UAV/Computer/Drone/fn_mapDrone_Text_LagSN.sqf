_map = _this select 0;
_display = ctrlparent _map;
_connectedUav = getConnectedUAV player;

_laggingInformation = _connectedUav getVariable ["TMAST_GPSSscintillationData", [670,67]];
_connectedUav setVariable ["TMAST_GPSSscintillationData", _laggingInformation, true];

_uavPosition = _display displayctrl 104;
[_uavPosition, _connectedUav, "TMAST_GPSSscintillationData", _connectedUav] call TMAST_fnc_uavPosition;

_uavHeading = _display displayctrl 148;
[_uavHeading, _connectedUav] call TMAST_fnc_uavHeading;

_uavSpeed = _display displayctrl 121;
[_uavSpeed, _connectedUav] call TMAST_fnc_uavSpeed;