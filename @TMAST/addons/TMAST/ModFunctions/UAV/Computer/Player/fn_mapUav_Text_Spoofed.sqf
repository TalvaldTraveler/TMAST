_map = _this select 0;
_display = ctrlparent _map;
_connectedUav = getConnectedUAV player;
_spoofedInformation = player getVariable ["TMAST_GPSSpoofedData", [313,67]];
player setVariable ["TMAST_GPSSpoofedData", _spoofedInformation];

_uavPosition = _display displayctrl 104;
[_uavPosition, _connectedUav, "TMAST_GPSSpoofedData", Player] call TMAST_fnc_uavPosition;