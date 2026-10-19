_miniMap = _this select 0;

[_miniMap] call TMAST_fnc_mapDrone_Text_LagSW;
[_miniMap] call TMAST_fnc_mapDrone_Focus_LagSW;
[false] call TMAST_fnc_setActivity_Uav;