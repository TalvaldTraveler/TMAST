_miniMap = _this select 0;

[_miniMap] call TMAST_fnc_mapDrone_Text_Spoofed;
[_miniMap] call TMAST_fnc_mapDrone_Focus_Spoofed;
[false] call TMAST_fnc_setActivity_Uav;