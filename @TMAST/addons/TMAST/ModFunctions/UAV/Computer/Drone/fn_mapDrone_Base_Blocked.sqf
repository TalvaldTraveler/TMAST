_miniMap = _this select 0;
_connectedUav = getConnectedUAV player;

[_miniMap] call TMAST_fnc_mapUav_Text_Blocked;
[true] call TMAST_fnc_setActivity_Uav;