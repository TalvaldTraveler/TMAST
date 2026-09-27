_map = _this select 0;
_display = ctrlparent _map;
_connectedUav = getConnectedUAV player;
_spoofedInformation = _connectedUav getVariable ["TMAST_GPSSpoofedData", [313,67]];
_connectedUav setVariable ["TMAST_GPSSpoofedData", _spoofedInformation, true];

_uavPosition = _display displayctrl 104;
[_uavPosition, _connectedUav, "TMAST_GPSSpoofedData", _connectedUav] call TMAST_fnc_dronePosition;