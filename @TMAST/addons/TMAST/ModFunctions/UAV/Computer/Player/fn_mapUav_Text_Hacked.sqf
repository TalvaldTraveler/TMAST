_map = _this select 0;
_display = ctrlparent _map;
_connectedUav = getConnectedUAV player;

_uavPosition = _display displayctrl 104;
[_uavPosition, _connectedUav, player] call TMAST_fnc_uavPosition_Hacked;

_uavHeading = _display displayctrl 148;
[_uavHeading, _connectedUav, player] call TMAST_fnc_uavHeading_Hacked;

_uavSpeed = _display displayctrl 121;
[_uavSpeed, _connectedUav, player] call TMAST_fnc_uavSpeed_Hacked;

_uavAlt = _display displayctrl 122;
[_uavAlt, _connectedUav, player] call TMAST_fnc_uavAlt_Hacked;

_uavStatus = _display displayctrl 102;
[_uavStatus, _connectedUav, player] call TMAST_fnc_uavStatus_Hacked;

_uavFuel = _display displayctrl 109;
[_uavFuel, _connectedUav, player] call TMAST_fnc_uavFuel_Hacked;