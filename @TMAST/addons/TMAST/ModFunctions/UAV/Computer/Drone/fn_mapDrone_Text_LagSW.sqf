_map = _this select 0;
_display = ctrlparent _map;
_connectedUav = getConnectedUAV player;

_laggingInformation = _connectedUav getVariable ["TMAST_GPSShadowData", [1337,69]];
_connectedUav setVariable ["TMAST_GPSShadowData", _laggingInformation, true];

_uavPosition = _display displayctrl 104;
[_uavPosition, _connectedUav, "TMAST_GPSShadowData", _connectedUav] call TMAST_fnc_uavPosition;

_uavHeading = _display displayctrl 148;
[_uavHeading, _connectedUav] call TMAST_fnc_uavHeading;

_uavSpeed = _display displayctrl 121;
[_uavSpeed, _connectedUav] call TMAST_fnc_uavSpeed;